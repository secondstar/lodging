require 'rails_helper'

RSpec.describe HotelSync, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  subject { HotelSync.new }
  describe '#title' do
    it 'works' do
      expect(subject.title).to eq("hotel sync")
    end
  end
  
  describe '#update_from_touringplans_com(wdw_uri)' do

    # it 'works' do
    #   tph = create(:touring_plans_hotel)
    #   wdw_uri  = tph.wdw_uri
    #   name     = tph.name
    #   expect(HotelSync.new.update_from_touringplans_com(wdw_uri)).to eq("something") #update works!
    # end
    
    it 'returns an updated Hotel' do
      tph = create(:touring_plans_hotel)
      wdw_uri  = tph.wdw_uri
      expect(HotelSync.new.update_from_touringplans_com(wdw_uri)).to be_a(Hotel)
    end
    
  end
  
  describe '#attach_foursquare_review_to_hotel(hotel_name)' do

    # it 'works' do
    #   #make multiple hotels
    #   create_list(:hotel, 25)
    #   #make multiple foursquare_reviews
    #   create_list(:foursquare_review, 25)
    #   #make a specific hotel
    #   hotel               = create(:hotel, foursquare_venue_id: "", name: "Disney's Contemporary Resort")
    #   #make a specific foursquare_review
    #   foursquare_review   = create(:foursquare_review, venue_id: "4b761bb6f964a520333d2ee3", name: "Disney's Contemporary Resort")
    #   #run the method to copy the foursquare_review.venue_id to hotel.foursquare_venue_id
    #   #the hotel.foursquare_venue_id should == foursquare_review.venue_id
    #   expect(HotelSync.new.attach_foursquare_review_to_hotel(hotel.name)).to eq("something") #update works!
    #
    # end
    
    it 'updates hotel.foursquare_venue_id to be the same as its foursquare_review' do
      #make multiple hotels
      create_list(:hotel, 25)
      #make multiple foursquare_reviews
      create_list(:foursquare_review, 25)
      #make a specific hotel
      hotel               = create(:hotel, foursquare_venue_id: "", name: "Disney's Contemporary Resort")
      #make a specific foursquare_review
      foursquare_review   = create(:foursquare_review, venue_id: "4b761bb6f964a520333d2ee3", name: "Disney's Contemporary Resort")
      #run the method to copy the foursquare_review.venue_id to hotel.foursquare_venue_id
      #the hotel.foursquare_venue_id should == foursquare_review.venue_id
      expect(HotelSync.new.attach_foursquare_review_to_hotel(hotel.name).foursquare_venue_id).to eq(foursquare_review.venue_id) #update works!
      
    end
  end
end
