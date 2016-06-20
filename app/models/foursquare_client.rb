class FoursquareClient
  attr_reader :client_id, :client_secret, :search_radius, :center_lat, :center_lng
  
  def initialize(connection:, routes:)
    @connection   = connection
    @routes       = routes
  end
  
  def title
    "i am foursquare"
  end
  
  def search_reviews(query = "")
    reviews = client.search_venues(:ll => "#{@center_lat}, #{@center_lng}", 
        query:      query, 
        categoryId: @categoryId,
        radius:     @search_radius
        )
    review = reviews
  end
  
  def client
    client = Foursquare2::Client.new(:client_id => @client_id, 
        :client_secret => @client_secret, 
        :api_version => @api_version)
  end
  
  
end