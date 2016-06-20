require 'foursquare2'
require 'hashie'

class FoursquareVenue
  attr_reader :client_id, :client_secret, :api_version, :search_radius, :center_lat, :center_lng
  
  def initialize(client_id: FOURSQUARE_ID, 
        client_secret: FOURSQUARE_SECRET,
        api_version:    "20160609",
        search_radius:  '6000',
        categoryId:     "4bf58dd8d48988d1fa931735",
        center_lat:     '28.37777',
        center_lng:     '-81.56498')
        
        @client_id      = client_id
        @client_secret  = client_secret
        @api_version    =  api_version
        @search_radius  = search_radius
        @categoryId     = categoryId
        @center_lat     = center_lat
        @center_lng     = center_lng
  end
  
  ROUTES = {
    search_venues:
      {lat_and_lng: "#{@center_lat}, #{@center_lng}",
        categoryId: @categoryId,
        radius:     @search_radius
      }
    }
  
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