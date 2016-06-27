class FoursquareGuaranteedVenue
  
  attr_reader :connection

  def initialize(connection: FoursquareConnection.new(api_version: '20160607', query:{}))
    @connection       = connection
  end
  
  def self.find_by_wdw_uri(wdw_uri)
    # wdw_uris = tphi.seed_data.collect {|seed| seed[:wdw_uri]}
    FoursquareVenue.new.find_venue(wdw_uri.to_s) || FoursquareMissingVenue.new
  end
  
  def venue#(venue_id: connection.venue_id)
    # "paradise"
    fv = FoursquareVenue.new(connection: connection).venue || FoursquareMissingVenue.new
    
  end
end
