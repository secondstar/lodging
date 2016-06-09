require 'nokogiri'
require 'open-uri'

class TouringPlansComFeed
  attr_reader :source_index_uri
  def initialize(source_index_uri: 'https://touringplans.com/walt-disney-world/hotels')
    @source_index_uri = source_index_uri
  end
  
  include HTTParty
  # debug_output $stderr
  base_uri 'touringplans.com'
  default_params :output => 'json'
  format :json

  def collect_list_of_disney_hotels(doc_link: @source_index_uri)
    doc = Nokogiri::HTML(open("https://touringplans.com/walt-disney-world/hotels"))
    links = []
    anchors = doc.css("a").to_a

    anchors.each do |anchor|
      if( /walt-disney-world\/hotels\/*disney*/.match(anchor['href'])||/walt-disney-world\/hotels\/fort/.match(anchor['href'])
        )
      link = Hash.new
      link[:name] = anchor.text
      permalink   = anchor['href'].split("/").last.to_s
      link[:permalink] = permalink
      links << link
      end
    end
    return links
  end

  def get_hotel_details_by_permalink(hotel_permalink)
    # http://touringplans.com/walt-disney-world/dining/chuck-wagon.json
    hotel_name  = hotel_permalink.split("-").join(" ")
    link        = _construct_hotel_url(hotel_permalink)
    # puts "link: #{link}"
    response = TouringPlansComFeed.get(link)
    case response.code
      when 200
        @hotel = TouringPlansComFeed.get(link).parsed_response
      when 404
        @hotel               = _echo_back_empty_hash
        @hotel["permalink"]  = hotel_permalink
        @hotel["name"]       = hotel_name
      when 500...600
        puts "ZOMG ERROR #{response.code}"
        @hotel               = _echo_back_empty_hash
        @hotel["permalink"]  = hotel_permalink
        @hotel["name"]       = hotel_name
    end

    @hotel
  end

  def _construct_hotel_url(permalink)
    hotel_permalink = []
    hotel_permalink << _hotel_permalink_root
    hotel_permalink << permalink
    "#{hotel_permalink.join('/')}.json"
    
  end

   def _hotel_permalink_root
    @source_index_uri
  end
  
  def _echo_back_empty_hash
    {"name"=>"",
     "address"=>"",
     "city"=>"",
     "state_code"=>"FL",
     "zip_code"=>"",
     "phone_number"=>"",
     "url"=>"",
     "off_site"=>false,
     "water_sports"=>false,
     "marina"=>false,
     "beach"=>false,
     "tennis"=>false,
     "biking"=>false,
     "suites"=>false,
     "concierge_floor"=>false,
     "room_service"=>false,
     "wired_internet"=>false,
     "wireless_internet"=>true,
     "num_rooms"=>0,
     "theme"=>"",
     "cost_range"=>"",
     "shuttle_to_parks"=>true,
     "cost_estimate"=>"",
     "lodging_area_code"=>"",
     "category_code"=>""}
  end

end
