# require "#{Rails.root}/lib/apis/representations/search_venue"
# require "#{Rails.root}/lib/apis/client"
# require "#{Rails.root}/lib/apis/connection"
# require "#{Rails.root}/lib/apis/foursquare_routes"
# require "#{Rails.root}/lib/apis/representation"
# require "/Users/captainproton/Sites/wdwhub/lodging/lib/apis/representation"
# require "#{Rails.root}/lib/apis/representations/search_venue"
# require "#{Rails.root}/lib/apis/representer"
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
  
  # def search_reviews(query = "")
  #   reviews = client.search_venues(:ll => "#{@center_lat}, #{@center_lng}",
  #       query:      query,
  #       categoryId: @categoryId,
  #       radius:     @search_radius
  #       )
  #   review = reviews
  # end
  #
  # def client
  #   client = Foursquare2::Client.new(:client_id => @client_id,
  #       :client_secret => @client_secret,
  #       :api_version => @api_version)
  # end
  
  def search_venues(search_term)
    connection      = @connection
    responses = []
    # connection.query({client_id: @connection.client_id, client_secret:@connection.client_secret})
    #
    # client   = FoursquareClient.new(connection: connection, routes: ROUTES)
    # response = Representation.new(client.elections)
    # connection = @connection

    connection.query({query: search_term,
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
  
  def find_venue(venue_id)
    client = FoursquareClient
  end
end