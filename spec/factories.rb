FactoryGirl.define do
  factory :cached_flickr_photo do
    id "MyString"
    owner "MyString"
    secret "MyString"
    server "MyString"
    farm 1
    title "MyString"
    ispublic false
    isfriend false
    isfamily false
    hotel_id 1
  end
  factory :flickr_search_filter do
    user_id "MyString"
    tags "MyString"
    tag_mode "MyString"
    text "MyString"
    min_upload_date "MyString"
    max_upload_date "MyString"
    min_taken_date "MyString"
    max_taken_date "MyString"
    license "MyString"
    sort "MyString"
    privacy_filter "MyString"
    bbox "MyString"
    accuracy "MyString"
    safe_search "MyString"
    content_type "MyString"
    machine_tags "MyString"
    machine_tag_mode "MyString"
    group_id "MyString"
    faves "MyString"
    camera "MyString"
    jump_to "MyString"
    contacts "MyString"
    woe_id "MyString"
    place_id "MyString"
    media "MyString"
    has_geo "MyString"
    geo_context "MyString"
    lat "MyString"
    lon "MyString"
    radius "MyString"
    radius_units "MyString"
    is_commons "MyString"
    in_gallery "MyString"
    person_id "MyString"
    is_getty "MyString"
    username "MyString"
    exif_min_exposure "MyString"
    exif_max_exposure "MyString"
    exif_min_aperture "MyString"
    exif_max_aperture "MyString"
    exif_min_focallen "MyString"
    exif_max_focallen "MyString"
    exclude_user_id "MyString"
    extras "MyString"
    per_page "MyString"
    page "MyString"
    hotel nil
  end
  factory :hotel_sync do
    
  end
  
  
  factory :foursquare_tip do
    sequence(:venue_id) { |n| "4dacf7411e72c4e8dcb3e1b#{n}/"}
    text "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    tip_kind "user"
    sequence(:canonical_url) { |n| "https://foursquare.com/item/4dd1b2a131517a89d2733480#{n}/"}

    lang "en"
    sequence(:likes) { |n| "#<Hashie::Mash count=#{n} groups=[#<Hashie::Mash count=#{n} items=[] type=\"others\">] summary=\"#{n} likes\">" }
    agree_count 1
    disagree_count 1
  end
  factory :foursquare_venue_photo do
    
  end
  factory :foursquare2_client do
    
  end
  factory :foursquare_photo do
    source "#<Hashie::Mash name=\"Swarm for iOS\" url=\"https://www.swarmapp.com\">"
    prefix "https://irs3.4sqi.net/img/general/"
    suffix "/18091_lEFWfgKyacB7YzST7RRQDUsxSc4_VE3eoPRh-pKb_EM.jpg"
    width 1920
    height 1440
    visibility "public"
    foursquare_user_id "18091"
    foursquare_photo_id "5777d540498e5c2289666255"
    sequence(:foursquare_venue_id) { |n| "4dacf7411e72c4e8dcb3e1b#{n}/"}
  end
  
  
  factory :foursquare_review do
    sequence(:venue_id) { |n| "4dacf7411e72c4e8dcb3e1b#{n}/"}
    sequence(:name) { |n| ":foursquare_review name#{n}/"}
    sequence(:address) { |n| "[\"Disney's Animal Kingdom Lodge (Walt Disney World)#{n}\", \"Lake Buena Vista, FL 32830\", \"United States\"]/"}
    cross_street "MyString"
    lat "28.35411051001386"
    lng "-81.60560443997383"
    alt_venues "MyString"
    searched_for "MyString"
    categories     "categories"
    referral_id   "referral_id"
    location     "location"
    canonical_url     "canonical_url"
    verified  true
    dislike   false
    ok  true
    rating  8.3
    rating_color   "rating_color"
    rating_signals   "rating_signals"
    allow_menu_url_edit  false
    specials   "specials"
    sequence(:wdw_uri) { |n| "//disneyworld.disney.go.com/resorts/animal-kingdom-villas-kidani#{n}/"}

  end
  factory :foursquare_missing_venue do
    
  end
  factory :foursquare_guaranteed_venue do
    
  end
  factory :touring_plans_com_feed do
    
  end
  factory :touring_plans_hotel do
    name "name string"
    address "address MyString"
    city "city MyString"
    state_code "FL"
    zip_code "11111"
    phone_number "5555551212"
    wdw_uri "//disneyworld.disney.go.com/resorts/art-of-animation-resort"
    off_site false
    water_sports false
    marina false
    beach false
    tennis false
    biking false
    suites false
    concierge_floor false
    room_service false
    wired_internet false
    wireless_internet false
    num_rooms 1
    cost_range "MyString"
    shuttle_to_parks "MyString"
    cost_estimate "MyString"
    lodging_area_code "MyString"
    category_code "MyString"
    permalink "MyString"
    theme "computer modern"
  end
  
  factory :hotel do
    sequence(:name) { |n| "Hotel Name#{n}"}
    sequence(:address) { |n| "Address#{n}"}
    city "MyString"
    state_code "MyString"
    zip_code "MyString"
    phone_number "MyString"
    sequence(:wdw_uri) { |n| "//disneyworld.disney.go.com/resorts/animal-kingdom-villas-kidani#{n}/"}
    off_site false
    water_sports false
    marina false
    beach false
    tennis false
    biking false
    suites false
    concierge_floor false
    room_service false
    wired_internet false
    wireless_internet false
    num_rooms 1
    cost_range "MyString"
    shuttle_to_parks "MyString"
    cost_estimate "MyString"
    lodging_area_code "wdw"
    category_code "MyString"
    # foursquare_venue_id "4dacf7411e72c4e8dcb3ebf5"
    sequence(:foursquare_venue_id) { |n| "4dacf7411e72c4e8dcb3ebf#{n}/"}
    
    after(:create) do |hotel|
      FactoryGirl.create(:foursquare_review, :venue_id => hotel.foursquare_venue_id)
    end
    
  end
end
