FactoryGirl.define do
  factory :palooza do
    name "MyString"
    lat "MyString"
    lng "MyString"
  end
  factory :hotel_sync do
    
  end
  factory :foursquare_tip do
    venue_id "MyString"
    text "MyString"
    type ""
    canonical_url "MyText"
    lang "MyString"
    likes "MyText"
    agree_count 1
    disagree_count 1
  end
  factory :foursquare_venue_photo do
    
  end
  factory :foursquare2_client do
    
  end
  factory :foursquare_photo do
    source "MyString"
    prefix "MyString"
    suffix "MyString"
    width 1
    height 1
    visibility "MyString"
    foursquare_user_id "MyString"
    foursquare_photo_id "MyString"
    foursquare_review nil
  end
  factory :foursquare_review do
    sequence(:venue_id) { |n| "4dacf7411e72c4e8dcb3e1b#{n}/"}
    name "MyString"
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
    name "MyString"
    address "MyString"
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
    
    after(:stub, :create, :build_stubbed) do |foursquare_venue_id|
      FactoryGirl.create(:foursquare_review, :venue_id => foursquare_venue_id)
    end
    
  end
end
