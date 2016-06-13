class TouringPlansHotel
  
  def initialize(seed_data: GuaranteedTouringPlansHotelRemoteIndex.find_all)
    @seed_data = seed_data
  end
  
  def collect_all_remote_hotels
    hotels = []
    @seed_data.each do |hotel|
      hotel_details = GuaranteedTouringPlansHotelRemoteHotel.find_by_permalink(hotel[:path])
      hotel_details["permalink"] = hotel[:path]
      hotels << hotel_details
    end
    return hotels
  end
  
  def save_all_remote_hotels
    remote_hotels = self.collect_all_remote_hotels
    remote_hotels = remote_hotels

    remote_hotels.each do |remote_hotel|
      hotel = Hotel.where(permalink: remote_hotel["permalink"]).first_or_create
      hotel.update(name: remote_hotel["name"], 
        address: remote_hotel["address"], 
        city: remote_hotel["city"], 
        state_code: remote_hotel["state_code"], 
        zip_code: remote_hotel["zip_code"], 
        phone_number: remote_hotel["phone_number"], 
        url: remote_hotel["url"], 
        off_site: remote_hotel["off_site"],
        water_sports: remote_hotel["water_sports"],
        marina: remote_hotel["marina"],
        beach: remote_hotel["beach"],
        tennis: remote_hotel["tennis"],
        biking: remote_hotel["biking"],
        suites: remote_hotel["suites"],
        concierge_floor: remote_hotel["concierge_floor"],
        room_service: remote_hotel["room_service"],
        wired_internet: remote_hotel["wired_internet"],
        wireless_internet: remote_hotel["wireless_internet"],
        num_rooms: remote_hotel["num_rooms"],
        theme: remote_hotel["theme"],
        cost_range: remote_hotel["cost_range"],
        shuttle_to_parks: remote_hotel["shuttle_to_parks"],
        cost_estimate: remote_hotel["cost_estimate"],
        lodging_area_code: remote_hotel["lodging_area_code"],
        category_code: remote_hotel["category_code"]
      )
    end
  end
  def seed_data
    @seed_data
  end
end
