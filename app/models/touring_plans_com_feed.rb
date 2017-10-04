require 'nokogiri'
require 'open-uri'
require 'uri'

class TouringPlansComFeed
  attr_reader :source_index_uri
  def initialize(source_index_uri: 'https://touringplans.com/walt-disney-world/hotels/websites')
    @source_index_uri = source_index_uri
  end
  
  include HTTParty
  # debug_output $stderr
  base_uri 'touringplans.com'
  default_params :output => 'json'
  format :json

  def collect_list_of_disney_hotels
    doc = Nokogiri::HTML(open(source_index_uri))
    permalinks            = []
    anchor_rows           = doc.css("table")[0].css("tr")    
    anchor_rows.each do |row|
      links_in_the_row          = row.css("a")
      permalink                 = Hash.new
      permalink[:name]  = links_in_the_row[0].text
      permalink[:permalink]          = links_in_the_row[0]['href']
      permalink[:wdw_uri]          = _parse_for_uri(links_in_the_row[1]['href'])
      permalinks << permalink
    end
    
    return permalinks
  end

  def get_hotel_details_by_permalink(hotel_permalink)
    # http://touringplans.com/walt-disney-world/dining/chuck-wagon.json
    # hotel_name  = "broken hotel permalink"
    link        = _construct_hotel_url(hotel_permalink)
    # puts "link: #{link}"
    response = TouringPlansComFeed.get(link)
    case response.code
      when 200
        @hotel = TouringPlansComFeed.get(link).parsed_response
      when 404
        @hotel               = _echo_back_empty_hash
        @hotel["permalink"]  = hotel_permalink
        @hotel["name"]       = "broken hotel permalink"
      when 500...600
        puts "ZOMG ERROR #{response.code}"
        @hotel               = _echo_back_empty_hash
        @hotel["permalink"]  = hotel_permalink
        @hotel["name"]       = "broken hotel permalink"
    end

    @hotel
  end

  def _get_source_index_table
    # pulls data from TP table of hotel links for onsite hotels and sets the rows in an array
    page = Nokogiri::HTML(open(@source_index_uri))
    Array(page.css("table")[0].css("tr"))
  end
  
  def _extract_permalinks_from_source_index_table
    permalinks =[]
    list.each do |row|
      links = row.css("a")
      path = links[0]['href']
      permalinks <<  path.to_s
    end
    return permalinks
  end
  def _construct_hotel_url(permalink)
    hotel_permalink = []
    hotel_permalink << _hotel_permalink_root
    hotel_permalink << permalink
    "#{hotel_permalink.join('/')}.json"
    
  end

   def _hotel_permalink_root
    'https://touringplans.com'
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
  
  def _parse_for_uri(link)
    link.split(/p*:/).last
  end

end
