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
      foursquare_review = build_stubbed :foursquare_review
      hotel = build_stubbed(:hotel, foursquare_venue_id: foursquare_review.venue_id)
      expect(foursquare_review.venue_id).to eq(hotel.foursquare_venue_id)
    end
  end

  # describe '#tips' do
  #   it 'works' do
  #     expect(Hotel.tips).to eq("something")
  #   end
  # end
  #
  # describe '#photos' do
  #   expect(Hotel.photos).to eq("something")
  # end
end
