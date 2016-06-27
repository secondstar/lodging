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
  
  def self.venue(v_id)
    fgv = FoursquareGuaranteedVenue.new(connection: FoursquareConnection.new(venue_id: v_id)).venue || FoursquareMissingVenue.new
    fr = FoursquareReview.where(foursquare_id: v_id).first_or_create
    fr.update(name:           fgv.name,
              # address:        fgv.location.fetch("formattedAddress", FoursquareMissingVenue.address),
              # lat:            fgv.location.fetch("lat", FoursquareMissingVenue.lat),
              # lng:            fgv.location.fetch("lng", FoursquareMissingVenue.lng),
              # categories:     [fgv.categories[0].fetch('name', FoursquareMissingVenue.categories)],
              location:       fgv.location.to_s,
              canonical_url:  fgv.canonicalUrl.to_s,
              verified:       fgv.verified,
              dislike:        fgv.dislike,
              ok:             fgv.ok,
              # rating:         fgv.rating || FoursquareMissingVenue.rating,
              # rating_color:   fgv.ratingColor || FoursquareMissingVenue.rating_color,
              rating_signals: fgv.ratingSignals.to_s || FoursquareMissingVenue.rating_signals,
              specials:       fgv.specials.to_s.to_s || FoursquareMissingVenue.specials
    
              # searched_for: wdw_uri
    )
    
  end
  
  def self.all
    wdw_uris            = TouringPlansHotelImport.new.seed_data.collect {|seed| seed[:wdw_uri]}
    venue_ids = wdw_uris.collect {|wdw_uri| FoursquareGuaranteedVenue.find_by_wdw_uri(wdw_uri).id}
    nogos               = venue_ids.zip(wdw_uris).select {|vi| vi.first == "none"}
    corrected_nogos_ids = nogos.collect {|nogo| FoursquareGuaranteedVenue.search_by_wdw_uri(nogo.last.split('/').last).select {|venue| venue.verified == true}.first.id}

    sorted              = venue_ids.sort
    sorted.pop(corrected_nogos_ids.length)
    all_ids = [sorted, corrected_nogos_ids].flatten

    
    responses = all_ids.each {|v_id| self.venue(v_id) }

  end
  
  def self._collect_venue_ids
    wdw_uris            = TouringPlansHotelImport.new.seed_data.collect {|seed| seed[:wdw_uri]}
    venue_ids           = wdw_uris.collect {|wdw_uri| FoursquareGuaranteedVenue.find_by_wdw_uri(wdw_uri)}
    nogos               = venue_ids.zip(wdw_uris).select {|vi| vi.first == "none"}
    corrected_nogos_ids = nogos.collect {|nogo| FoursquareGuaranteedVenue.search_by_wdw_uri(nogo.last.split('/').last).select {|venue| venue.verified == true}.first.id}

    sorted              = venue_ids.sort
    sorted.pop(corrected_nogos_ids.length)
    all_ids = [sorted, corrected_nogos_ids].flatten
  end
end