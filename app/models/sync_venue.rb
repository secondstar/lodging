class SyncVenue

  attr_reader :connection

  def initialize(connection: FoursquareConnection.new(api_version: '20160607', query:{verified: true}))
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
    fgv                   = FoursquareGuaranteedVenue.venue(v_id) || FoursquareMissingVenue.new
    fr                    = FoursquareReview.where(foursquare_id: v_id).first_or_create
    venue_default_values  = FoursquareMissingVenue.new
    fr.update(name:           fgv.name,
              address:        fgv.location.fetch("formattedAddress", venue_default_values.formatted_address),
              lat:            fgv.location.fetch("lat", venue_default_values.lat),
              lng:            fgv.location.fetch("lng", venue_default_values.lng),
              categories:     [fgv.categories[0].fetch('name', venue_default_values.categories)],
              location:       fgv.location.to_s,
              canonical_url:  fgv.canonicalUrl.to_s,
              verified:       fgv.verified,
              dislike:        fgv.dislike,
              ok:             fgv.ok,
              rating:         fgv.rating || venue_default_values.rating,
              rating_color:   fgv.ratingColor || venue_default_values.rating_color,
              rating_signals: fgv.ratingSignals.to_s || venue_default_values.rating_signals,
              specials:       fgv.specials.to_s.to_s || venue_default_values.specials,
              wdw_uri:        fgv.url.split(/p*:/).last || venue_default_values.wdw_uri
    
              # searched_for: wdw_uri
    )
    
  end
  
  def self.all
    all_ids = self._collect_venue_ids
    responses = all_ids.each {|venue_id| self.venue(venue_id) }

  end

  def self.all_photos
    # update all venues and get venue ID's
    all_saved_venues = FoursquareReview.all.select(:foursquare_id)
    all_saved_venue_ids = all_saved_venues.collect {|review| review[:foursquare_id] }
    
    all_saved_venue_ids.each do |venue_id|
      self.photos(venue_id)
    end
  end

  def self.photos(venue_id)
    photos = FoursquareGuaranteedVenue.venue_photos(venue_id: venue_id)
    review = FoursquareReview.where(foursquare_id: venue_id).first_or_create
    photos.each do |photo|
      puts photo
      fp = review.foursquare_photos.where(foursquare_photo_id: photo.id).first_or_create
      fp.update(source: photo.source.to_s,
                prefix: photo.prefix.to_s,
                suffix: photo.suffix.to_s,
                width:  photo.width.to_i,
                height: photo.height.to_i,
                visibility: photo.visibility.to_s,
                foursquare_user_id: photo.user.fetch('id'),
                foursquare_photo_id: photo.id
      )
    end

  end

  def self.all_tips
    # update all venues and get venue ID's
    all_saved_venues = FoursquareReview.all.select(:foursquare_id)
    all_saved_venue_ids = all_saved_venues.collect {|review| review[:foursquare_id] }
    
    all_saved_venue_ids.each do |venue_id|
      self.tips(venue_id)
    end
  end

  def self.tips(venue_id)
    tips = FoursquareGuaranteedVenue.venue_tips(venue_id: venue_id, search_term: '')
    review = FoursquareReview.where(foursquare_id: venue_id).first_or_create
    puts "Tips available #{tips.count}"
    total_tips = 0
    tips.each do |tip|
      total_tips += 1
      puts "Tips fufilled #{total_tips}/#{tips.count}"
      ft = review.foursquare_tips.where(foursquare_id: tip.id).first_or_create
      
      # ft = review.foursquare_tips.create(
      ft.update(
                venue_id:       venue_id.to_s,
                foursquare_id:  tip.id.to_s,
                text:           tip.text.to_s,
                tip_kind:       tip.type.to_s,
                canonical_url:  tip.canonicalUrl.to_s,
                lang:           tip.lang.to_s,
                likes:          tip.likes.to_s,
                agree_count:    tip.agreeCount,
                disagree_count: tip.disagreeCount
      )
    end

  end

# -------------------
  def self._collect_venue_ids
    search_terms_list = _collect_uris_and_search_terms
    venue_ids = search_terms_list.collect {|search_term| FoursquareGuaranteedVenue.find_by_wdw_uri(search_term).id}
    nogos_arrays_list               = venue_ids.zip(search_terms_list).select {|vi| vi.first == "none"}
    corrected_nogos_ids = _correct_nogos_and_return_ids(nogos_arrays_list)

    sorted              = venue_ids.sort
    sorted.pop(corrected_nogos_ids.length)
    all_ids = [sorted, corrected_nogos_ids].flatten
  end
  
  
  def self._collect_uris_and_search_terms
    broken_search_terms = ["swandolphin.com", 
        "shadesofgreen.org", 
        "disneyworld.disney.go.com/resorts/board-walk-villas/"
      ]
    fixed_search_terms  = ["Walt Disney World Swan Hotel", 
        "Shades Of Green Resort",
        "disneys-boardwalk-villas"
      ]
    wdw_uris            = _wdw_uris.grep_v(Regexp.union(broken_search_terms))
    improved_wdw_uris   = (wdw_uris << fixed_search_terms).flatten
    improved_wdw_uris#.values_at(0..1)
  end
  
  def self._correct_nogos_and_return_ids(nogos_arrays_list)
    nogo_paths_list = nogos_arrays_list.collect {|nogo_array| _get_path_of_uri(nogo_array) }
    nogo_paths_list = nogo_paths_list.grep_v("board-walk-villas")
    corrected_nogos = nogo_paths_list.collect {|nogo_path|
       FoursquareGuaranteedVenue.search_by_wdw_uri(nogo_path).select {|venue|
         venue.verified == true
       }.first
    }
    ids = corrected_nogos.collect {|venue| venue.id}
        
  end
  
  def self._get_path_of_uri(nogo_array)
    nogo_array.last.split('/').last
  end
  
  def self._wdw_uris
    tp_seed_data = TouringPlansHotelImport.new.seed_data
    uris = tp_seed_data.collect {|seed| seed[:wdw_uri]}
  end
end