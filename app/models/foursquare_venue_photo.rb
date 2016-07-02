class FoursquareVenuePhoto
  attr_reader :client, :venue_id
  
  DEFAULT_VENUE_ID          = ""
  
  def initialize(client: Foursquare2Client.new.client)
    @client           = client
  end
  
  def title 
    "foursquare2 photo"
  end
  
  def venue_photos(venue_id)
    array_of_hashed_details  = client.venue_photos(venue_id).fetch('items', ['no results'])
    photos      = array_of_hashed_details.collect {|item| OpenStruct.new(item) }
    
  end
end
