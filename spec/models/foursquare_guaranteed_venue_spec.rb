require 'rails_helper'

RSpec.describe FoursquareGuaranteedVenue, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  
  describe '#venue_photos(venue_id:)' do
    let(:venue_id) { "4b9b0114f964a520ffea35e3" }
    subject { FoursquareGuaranteedVenue.venue_photos(venue_id: venue_id) }
    let(:fsq_query) { File.read( Rails.root + 'spec/support/fixtures/bay-lake-at-contemporary-photos.json' ) }
    
    before do
      stub_request(:get, "https://api.foursquare.com/v2/venues/4b9b0114f964a520ffea35e3/photos?client_id=R1TDM0FYS2YSOFTWG2QU2DS0OE00BZLMQCQPMKUGO5CJGNYH&client_secret=1N5G1D22C2410VE3RJXPS10Y31E2WA0BT45KYJFTGR0S35QN&group=venue&v=20160609").
               with(:headers => {'Accept'=>'application/json', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby gem'}).
               to_return(:status => 200, :body => fsq_query, :headers => {})
      
    end
    # it 'works' do
    #   expect(subject).to eq("someting")
    # end
    
    it 'returns an Array' do
      expect(subject).to be_an(Array)
    end

    it 'returns an OpenStruct for the first element' do
      expect(subject.first).to be_an(OpenStruct)
    end
    it 'returns an OpenStruct for the last element' do
      expect(subject.last).to be_an(OpenStruct)
    end
  end
end
