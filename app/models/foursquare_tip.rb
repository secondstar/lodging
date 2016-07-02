class FoursquareTip
  
  DEFAULT_QUERY             = {}
  DEFAULT_VENUE_ID          = ""

  attr_reader :query, :client, :venue_id

  def initialize(client: Foursquare2Client.new.client)
    @client           = client
  end
  
  
  def title
    "foursquare2 tip"
  end
  
  def venue_tips(venue_id, search_term)
    tips_json = client.venue_tips(venue_id, :query => search_term)
    tips      = tips_json.items.collect {|item| OpenStruct.new(item) }
  end

end