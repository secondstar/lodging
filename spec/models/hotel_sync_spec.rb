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
end
