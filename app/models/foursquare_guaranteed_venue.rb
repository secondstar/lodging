class FoursquareGuaranteedVenue
  
  attr_reader :connection

  def initialize(connection: FoursquareConnection.new(api_version: '20160607', query:{verified: true}))
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
  
  def self.venue(venue_id)
    fv = FoursquareVenue.new(connection: FoursquareConnection.new(venue_id: venue_id, api_version: '20160607', query:{verified: true})).venue || FoursquareMissingVenue.new
    
  end
  
  def self.venue_photos(venue_id:)
    fvp = FoursquareVenuePhoto.new.venue_photos(venue_id)  || FoursquareMissingVenuePhoto.new
  end
  
  def self.venue_tips(venue_id:, search_term: '')
    fvt = FoursquareVenueTip.new.venue_tips(venue_id, search_term)  || FoursquareMissingVenueTips.new
  end

end
