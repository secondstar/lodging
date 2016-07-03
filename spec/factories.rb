FactoryGirl.define do
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
    foursquare_id "MyString"
    name "MyString"
    address "MyString"
    cross_street "MyString"
    lat "MyString"
    lng "MyString"
    alt_venues "MyString"
    searched_for "MyString"
    archived_at "2016-06-14 11:37:31"
  end
  factory :foursquare_missing_venue do
    
  end
  factory :foursquare_guaranteed_venue do
    
  end
  factory :touring_plans_com_feed do
    
  end
  factory :touring_plans_hotel do
    
  end
  factory :hotel do
    name "MyString"
    address "MyString"
    city "MyString"
    state_code "MyString"
    zip_code "MyString"
    phone_number "MyString"
    url "MyString"
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
  end
end
