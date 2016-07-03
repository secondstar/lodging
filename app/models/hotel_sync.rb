require 'fuzzy_match'

class HotelSync
  attr_reader :wdw_uris
  def initialize(wdw_uris: TouringPlansHotel.all.collect {|hotel| hotel.wdw_uri} )
    @wdw_uris = wdw_uris
  end
  
  
  def title
    "hotel sync"
  end
  
  def update_from_touringplans_com(wdw_uri)
      hotel = Hotel.where(wdw_uri: wdw_uri).first_or_create
      tp_hotel = TouringPlansHotel.where(wdw_uri: wdw_uri).first
      hotel_default_values  = MissingTouringPlansHotel.new
      hotel.update(name:      tp_hotel.name               || hotel_default_values.address,
        address:              tp_hotel.address            || hotel_default_values.address,
        city:                 tp_hotel.city               || hotel_default_values.city,
        state_code:           tp_hotel.state_code         || hotel_default_values.state_code,
        zip_code:             tp_hotel.zip_code           || hotel_default_values.zip_code,
        phone_number:         tp_hotel.phone_number       || hotel_default_values.phone_number,
        wdw_uri:              tp_hotel.wdw_uri            || hotel_default_values.wdw_uri,
        off_site:             tp_hotel.off_site           || hotel_default_values.off_site,
        water_sports:         tp_hotel.water_sports       || hotel_default_values.water_sports,
        marina:               tp_hotel.marina             || hotel_default_values.marina,
        beach:                tp_hotel.beach              || hotel_default_values.beach,
        tennis:               tp_hotel.tennis             || hotel_default_values.tennis,
        biking:               tp_hotel.biking             || hotel_default_values.biking,
        suites:               tp_hotel.suites             || hotel_default_values.suites,
        concierge_floor:      tp_hotel.concierge_floor    || hotel_default_values.concierge_floor,
        room_service:         tp_hotel.room_service       || hotel_default_values.room_service,
        wired_internet:       tp_hotel.wired_internet     || hotel_default_values.wired_internet,
        wireless_internet:    tp_hotel.wireless_internet  || hotel_default_values.wireless_internet,
        num_rooms:            tp_hotel.num_rooms.to_i     || hotel_default_values.num_rooms,
        shuttle_to_parks:     tp_hotel.shuttle_to_parks   || hotel_default_values.shuttle_to_parks,
        cost_estimate:        tp_hotel.cost_estimate      || hotel_default_values.cost_estimate,
        lodging_area_code:    tp_hotel.lodging_area_code  || hotel_default_values.lodging_area_code,
        category_code:        tp_hotel.category_code      || hotel_default_values.category_code,
        cost_range:           tp_hotel.cost_range         || hotel_default_values.cost_range,
        theme:                tp_hotel.theme              || hotel_default_values.theme

      )
  end
  
  def update_all_from_touringplans_com
    wdw_uris.each do |wdw_uri|
      update_from_touringplans_com(wdw_uri)
    end
  end
end
