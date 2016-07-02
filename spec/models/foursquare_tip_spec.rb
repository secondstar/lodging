require 'rails_helper'

RSpec.describe FoursquareTip, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  subject { FoursquareTip.new }
  describe '#title' do
    it 'works' do
      expect(subject.title).to eq("foursquare2 tip")
    end
  end
  
  describe '#f2c_venue_tips' do
    let(:venue_id) { "4b9b0114f964a520ffea35e3" }
    let(:search_term) { 'dvc' }
    let(:bay_tower_tips_query) { File.read( Rails.root + 'spec/support/fixtures/bay-lake-at-contempory-tips.json' ) }
    subject { FoursquareTip.new.f2c_venue_tips(venue_id, search_term) }
    
    before do
      stub_request(:get, "https://api.foursquare.com/v2/venues/4b9b0114f964a520ffea35e3/tips?client_id=R1TDM0FYS2YSOFTWG2QU2DS0OE00BZLMQCQPMKUGO5CJGNYH&client_secret=1N5G1D22C2410VE3RJXPS10Y31E2WA0BT45KYJFTGR0S35QN&v=20160609").
        with(:headers => {'Accept'=>'application/json', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby gem'}).
        to_return(:status => 200, :body => bay_tower_tips_query, :headers => {})
    end
    # it 'works' do
    #   expect(subject).to eq("something")
    # end
    
    it 'returns a count of 4' do
      expect(subject.count).to eq(4)
    end
    
    it 'returns a collection within an array' do
      expect(subject).to be_an(Array)
    end
    
    it 'returns an OpenStruct for the first element' do
      expect(subject.first).to be_a(OpenStruct)
    end
  
    it 'returns an String for the first element id' do
      expect(subject.first.id).to be_a(String)
    end
  
    it "returns an String for the first element's description" do
      expect(subject.first.text).to be_a(String)
    end
  
    it "returns an Integer for the first element's agreeCount" do
      expect(subject.first.agreeCount).to be_an(Integer)
    end
  
    it "returns an Integer for the first element's disagreeCount" do
      expect(subject.first.disagreeCount).to be_an(Integer)
    end
  
    it "returns an Hash for the first tip's author" do
      expect(subject.first.user).to be_an(Hash)
    end
end

end
