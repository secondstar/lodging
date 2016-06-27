require "search_venue"

class FoursquareVenue

  attr_reader :connection, :routes, :client
  ROUTES = FoursquareRoutes.routes
  
  def initialize(routes: ROUTES,
    connection: FoursquareConnection.new(api_version: '20160607', query:{})
    )
    @connection       = connection
    
    
    @client           = FoursquareClient.new(connection: @connection, routes: ROUTES)
  end
  
  
    def title
    "i am foursquare"
  end
  
  def search_venues(search_term)
    connection      = @connection
    responses = []
    # connection.query({client_id: @connection.client_id, client_secret:@connection.client_secret})
    #
    # client   = FoursquareClient.new(connection: connection, routes: ROUTES)
    # response = Representation.new(client.elections)
    # connection = @connection

    connection.query({query: search_term.to_s,
      client_id: @connection.client_id, 
      client_secret: @connection.client_secret, 
      v: @connection.api_version, 
      ll: @connection.lat_and_lng})
    
    client = FoursquareClient.new(connection: connection, routes: ROUTES)
    search_venues = client.search_venues.fetch('response').fetch('venues')
    search_venues.each do |venue|
      strained_venue  = venue.except("contact", "location","categories", "hereNow", "stats", "specials")
      response        = OpenStruct.new(strained_venue)
      responses << response
    end
    responses
    # venue = search_venues.first
    # strained_venue = venue.except("contact", "location","categories", "hereNow", "stats", "specials")
    # response = Representation.new(strained_venue)
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
    
    client = FoursquareClient.new(connection: connection, routes: ROUTES)
    venue = client.venue.fetch('response').fetch('venue')
    response        = OpenStruct.new(venue)
    # response = Representation.new(venue)
  end
  
  def venue_photos(venue_id: @connection.venue_id)
    venue = self.venue(venue_id: venue_id)
    photos = venue.photos.fetch("groups", 'groups not available')[0].fetch('items', 'no photos available')
    response = photos.collect {|photo| OpenStruct.new(photo) }
    

  end
  
end