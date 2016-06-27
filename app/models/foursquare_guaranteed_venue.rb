class FoursquareGuaranteedVenue
  
  attr_reader :connection

  def initialize(connection: FoursquareConnection.new(api_version: '20160607', query:{}))
    @connection       = connection
  end
  
  def self.search_by_wdw_uri(wdw_uri)
    # wdw_uris = tphi.seed_data.collect {|seed| seed[:wdw_uri]}
    FoursquareVenue.new.search_venues(wdw_uri.to_s) || FoursquareMissingVenue.new
  end
  
  def self.find_by_wdw_uri(wdw_uri)
    # wdw_uris = tphi.seed_data.collect {|seed| seed[:wdw_uri]}
    FoursquareVenue.new.find_venue(wdw_uri.to_s) || FoursquareMissingVenue.new
  end
  
  def venue#(venue_id: connection.venue_id)
    # "paradise"
    fv = FoursquareVenue.new(connection: connection).venue || FoursquareMissingVenue.new
    
  end
  
  def self.venue_photos(venue_id:)
    # "paradise"
    fv = FoursquareVenue.new(connection: FoursquareConnection.new(venue_id: venue_id, query:{limit: 30})).venue_photos  || FoursquareMissingVenue.new
  end
  
end
