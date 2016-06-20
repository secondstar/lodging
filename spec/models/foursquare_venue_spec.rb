require 'rails_helper'

RSpec.describe FoursquareVenue do
  subject { FoursquareVenue.new }

  describe "#title" do
    # params = {path: "whispering-canyon-cafe", yql_css_parse: 'article .entry-content p' }
    # let(:target) { OpenStruct.new(params) }
    it "works" do
      expect(subject.title).to eq("i am foursquare")
    end
  end
  
  describe '#search_reviews' do
    let(:fb_search_reviews) { File.read( Rails.root + 'spec/support/fixtures/fb_search_reviews.json' ) }
    
    # disney example
    it 'has "venues" as the first element' do
      stub_request(:get, "https://api.foursquare.com/v2/venues/search?client_id=R1TDM0FYS2YSOFTWG2QU2DS0OE00BZLMQCQPMKUGO5CJGNYH&client_secret=1N5G1D22C2410VE3RJXPS10Y31E2WA0BT45KYJFTGR0S35QN&ll=28.37777,%20-81.56498&query=disney&radius=6000&v=20160609").
               with(:headers => {'Accept'=>'application/json', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby gem'}).
               to_return(:status => 200, :body => fb_search_reviews, :headers => {})
      
      expect(subject.search_reviews( "disney").keys.first).to eq ("venues")
    end
    
  
  end
  
  describe '#find_review using a name foursquare.com knows' do
  
  end
  
  describe '#find_review using a name foursquare.com does _not_ know but FoursquareBridge does' do
  
  end
  
  describe '#find_review using a name foursquare.com does _not_ know and FoursquareBridge does _not_ ' do
  
  end
  
  describe '#yield_default_venue' do
  
  end
  
  describe '#_detect_desired_review with good query' do
  
  end
  
  describe '#_create_default_review' do
  
  end
  
  
end
