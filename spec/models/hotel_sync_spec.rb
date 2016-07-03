require 'rails_helper'

RSpec.describe HotelSync, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  subject { HotelSync.new }
  describe '#title' do
    it 'works' do
      expect(subject.title).to eq("hotel sync")
    end
  end
  
end
