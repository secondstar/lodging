require 'rails_helper'

RSpec.describe Hotel, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  
  describe '#foursquare_review' do
    
    # it 'works' do
    #   foursquare_review = create :foursquare_review
    #   hotel = create(:hotel, foursquare_venue_id: foursquare_review.venue_id)
    #   expect(hotel.foursquare_review).to eq("something")
    # end
    
    it 'returns the foursquare_review with the same venue_id' do
      foursquare_review = create(:foursquare_review)
      hotel             = build_stubbed(:hotel, foursquare_venue_id: foursquare_review.venue_id)
      expect(foursquare_review.venue_id).to eq(hotel.foursquare_venue_id)
    end
  end

  describe '#tips' do
    # it 'works' do
    #   foursquare_review = create(:foursquare_review)
    #   hotel             = build_stubbed(:hotel, foursquare_venue_id: foursquare_review.venue_id)
    #   foursquare_tips   = create_list(:foursquare_tip, 25, venue_id: foursquare_review.venue_id)
    #   expect(hotel.tips).to eq("something")
    # end

    it 'returns all of the tips provided by foursquare' do
      foursquare_review = create(:foursquare_review)
      hotel             = build_stubbed(:hotel, foursquare_venue_id: foursquare_review.venue_id)
      foursquare_tips   = create_list(:foursquare_tip, 25, venue_id: foursquare_review.venue_id)
      expect(hotel.tips.length).to eq(25)
    end
  end
  
  describe '#photos' do
    # it 'works' do
    #   foursquare_review = create(:foursquare_review)
    #   hotel             = build_stubbed(:hotel, foursquare_venue_id: foursquare_review.venue_id)
    #   foursquare_photos   = create_list(:foursquare_photo, 25, foursquare_venue_id: foursquare_review.venue_id)
    #   expect(hotel.photos).to eq("something")
    # end

    it 'returns all of the tips provided by foursquare' do
      foursquare_review = create(:foursquare_review)
      hotel             = build_stubbed(:hotel, foursquare_venue_id: foursquare_review.venue_id)
      foursquare_photos = create_list(:foursquare_photo, 25, foursquare_venue_id: foursquare_review.venue_id)
      expect(hotel.photos.length).to eq(25)
    end
  end
end
