require 'rails_helper'

RSpec.describe FoursquareVenuePhoto, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  subject { FoursquareVenuePhoto.new }
  describe '#title' do
    it 'works' do
      expect(subject.title).to eq("foursquare2 photo")
    end
  end
  
  describe 'venue_photos' do
    let(:venue_id) { "4b9b0114f964a520ffea35e3" }
    let(:bay_tower_tips_query) { File.read( Rails.root + 'spec/support/fixtures/bay-lake-at-contemporary-photos.json' ) }

    subject { FoursquareVenuePhoto.new.venue_photos(venue_id) }
      
      before do
        stub_request(:get, "https://api.foursquare.com/v2/venues/4b9b0114f964a520ffea35e3/photos?client_id=R1TDM0FYS2YSOFTWG2QU2DS0OE00BZLMQCQPMKUGO5CJGNYH&client_secret=1N5G1D22C2410VE3RJXPS10Y31E2WA0BT45KYJFTGR0S35QN&group=venue&v=20160609").
          with(:headers => {'Accept'=>'application/json', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby gem'}).
          to_return(:status => 200, :body => bay_tower_tips_query, :headers => {})
      end

    # it 'works' do
    #   expect(subject).to eq("something")
    # end
    
    it 'returns an Array' do
      expect(subject).to be_an(Array)
    end
    
    it 'returns an Array of OpenStruct' do
      expect(subject.first).to be_an(OpenStruct)
      expect(subject.last).to be_an(OpenStruct)
    end
    
    it 'returns a count 4 within 30' do
      expect(subject.count).to be_within(4).of(30)
    end
    
    it 'returns an String for the first element id' do
      expect(subject.first.id).to be_a(String)
    end
  
    it "returns an Integer for the first element's height" do
      expect(subject.first.height).to be_a(Integer)
    end
    
    it "returns an Integer for the first element's width" do
      expect(subject.first.width).to be_a(Integer)
    end
    
    it "returns an String for the first element's prefix" do
      expect(subject.first.prefix).to be_a(String)
    end

    it "returns an String for the first element's suffix" do
      expect(subject.first.suffix).to be_a(String)
    end
    
  end
end
