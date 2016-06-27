class SyncVenue

  attr_reader :connection

  def initialize(connection: FoursquareConnection.new(api_version: '20160607', query:{}))
    @connection       = connection
  end
  
  def self.foursquare_summary(wdw_uri)
    fgv = FoursquareGuaranteedVenue.find_by_wdw_uri(wdw_uri)
    fr = FoursquareReview.where(foursquare_id: fgv.id).first_or_create
    fr.update(name: fgv.name, 
              searched_for: wdw_uri
    )
  end
  
  def venue#(venue_id: connection.venue_id)
    # "paradise"
    fgv = FoursquareGuaranteedVenue.new(connection: connection).venue || FoursquareMissingVenue.new
    
  end
  
end