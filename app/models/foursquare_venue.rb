require "search_venue"

class FoursquareVenue

  attr_reader :connection, :routes, :client
  ROUTES = FoursquareRoutes.routes
  
  def initialize(routes: ROUTES,
    connection: FoursquareConnection.new(api_version: '20160607', query:{verified: true})
    )
    @connection       = connection
    @client           = FoursquareClient.new(connection: connection, routes: ROUTES)
  end
  
  
    def title
    "i am foursquare"
  end
  
  def search_venues(search_term)
    responses = []
    connection.query({query: "#{search_term.to_s} resort",
      client_id: connection.client_id, 
      client_secret: connection.client_secret, 
      v: connection.api_version, 
      ll: connection.lat_and_lng})
    
    client = FoursquareClient.new(connection: connection, routes: ROUTES)
    search_venues = client.search_venues.fetch('response', "no response found").fetch('venues', "no venues found")
    search_venues.each do |venue|
      strained_venue  = venue.except("contact", "location","categories", "hereNow", "stats", "specials")
      response        = OpenStruct.new(strained_venue)
      responses << response
    end
    responses
  end
  
  def find_venue(search_term)
    responses = self.search_venues(search_term)
    result    = responses.first
    
  end
  
  def venue(venue_id: @connection.venue_id)
    connection      = @connection
    responses = []
    
    connection.query({client_id: @connection.client_id, 
      client_secret: @connection.client_secret, 
      v: @connection.api_version, 
      ll: @connection.lat_and_lng})
    
    client    = FoursquareClient.new(connection: connection, routes: ROUTES)
    venue     = client.venue.fetch('response').fetch('venue')
    response  = OpenStruct.new(venue)
    # response = Representation.new(venue)
  end

end