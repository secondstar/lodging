class TouringPlansHotelImport
  
  attr_reader :seed_data
  
  def initialize(seed_data: GuaranteedTouringPlansHotelRemoteIndex.find_all)
    @seed_data = seed_data
  end
  
  def collect_all_remote_hotels
    hotels = []
    seed_data.each do |hotel|
      hotel_details = GuaranteedTouringPlansHotelRemoteHotel.find_by_permalink(hotel[:permalink])
      hotel_details["wdw_uri"] = hotel[:wdw_uri]
      hotels << hotel_details
    end
    return hotels
  end

  def collect_remote_hotel(permalink)
      hotel_details = GuaranteedTouringPlansHotelRemoteHotel.find_by_permalink(permalink)
  end
  
  def save_all_remote_hotels
    # remote_hotels = self.collect_all_remote_hotels
    # remote_hotels = remote_hotels
    permalinks_and_wdw_uris = Array.new
    seed_data.each do |seed|
      permalinks_and_wdw_uris << seed.except(:name)
    end
    # permalinks_and_wdw_uris = seed_data.collect {|seed| seed.except(:name)}

    permalinks_and_wdw_uris.each do |seed|
      # puts seed[:permalink]
      remote_hotel = self.collect_remote_hotel(seed[:permalink])
      hotel = TouringPlansHotel.where(permalink: seed[:permalink]).first_or_create
      # hotel.save(permalink: seed[:permalink].to_s, wdw_uri: seed[:wdw_uri].to_s)
      # remote_hotels = permalinks.collect {|permalink| self.collect_remote_hotel(permalink)}
      puts seed
      hotel.update(name:    remote_hotel["name"],
        address:            remote_hotel["address"],
        city:               remote_hotel["city"],
        state_code:         remote_hotel["state_code"],
        zip_code:           remote_hotel["zip_code"],
        phone_number:       remote_hotel["phone_number"],
        url:                remote_hotel["url"],
        off_site:           remote_hotel["off_site"],
        water_sports:       remote_hotel["water_sports"],
        marina:             remote_hotel["marina"],
        beach:              remote_hotel["beach"],
        tennis:             remote_hotel["tennis"],
        biking:             remote_hotel["biking"],
        suites:             remote_hotel["suites"],
        concierge_floor:    remote_hotel["concierge_floor"],
        room_service:       remote_hotel["room_service"],
        wired_internet:     remote_hotel["wired_internet"],
        wireless_internet:  remote_hotel["wireless_internet"],
        num_rooms:          remote_hotel["num_rooms"],
        theme:              remote_hotel["theme"],
        cost_range:         remote_hotel["cost_range"],
        shuttle_to_parks:   remote_hotel["shuttle_to_parks"],
        cost_estimate:      remote_hotel["cost_estimate"],
        lodging_area_code:  remote_hotel["lodging_area_code"],
        category_code:      remote_hotel["category_code"],
        wdw_uri:            seed[:wdw_uri]
      )
    end
  end

end
