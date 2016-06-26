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
  
  # describe '#search_reviews' do
  #   let(:fb_search_reviews) { File.read( Rails.root + 'spec/support/fixtures/fb_search_reviews.json' ) }
  #
  #   # disney example
  #   it 'has "venues" as the first element' do
  #     stub_request(:get, "https://api.foursquare.com/v2/venues/search?client_id=R1TDM0FYS2YSOFTWG2QU2DS0OE00BZLMQCQPMKUGO5CJGNYH&client_secret=1N5G1D22C2410VE3RJXPS10Y31E2WA0BT45KYJFTGR0S35QN&ll=28.37777,%20-81.56498&query=disney&radius=6000&v=20160609").
  #              with(:headers => {'Accept'=>'application/json', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby gem'}).
  #              to_return(:status => 200, :body => fb_search_reviews, :headers => {})
  #
  #     expect(subject.search_reviews( "disney").keys.first).to eq ("venues")
  #   end
  #
  #
  # end
  
  describe '#search_venues' do
    let(:fsq_query) { File.read( Rails.root + 'spec/support/fixtures/fourscore_venues_search_query_disney.json' ) }
    let(:target) { subject.search_venues("disney") }
    before do
      stub_request(:get, "https://api.foursquare.com/v2/venues/search/?client_id=R1TDM0FYS2YSOFTWG2QU2DS0OE00BZLMQCQPMKUGO5CJGNYH&client_secret=1N5G1D22C2410VE3RJXPS10Y31E2WA0BT45KYJFTGR0S35QN&ll=28.37777,-81.56498&query=disney&v=20160607").
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => fsq_query, :headers => {})
    end

    # it 'works' do
    #   expect(target[0]).to eq("something")
    # end

    # # disney example
    
    it 'is an Array' do
      expect(target).to be_a(Array)
    end
    
    it 'contains OpenStructs' do
      expect(target[0]).to be_a(OpenStruct)
      expect(target.last).to be_a(OpenStruct)
    end
    
    it 'has an OpenStruct as the first element of the Array with an id that has a length between 20 and 30 characters' do
      expect(target.first.id.length).to be_within(20).of(30)
    end

    it 'has an OpenStruct as the first element of the Array with a name that has a length more than 3 characters' do
      expect(target.first.name.length).to be >= 2
    end

    it 'has an OpenStruct as the first element of the Array with a url that has a length more than 7 characters' do
      expect(target.first.url.length).to be >= 7
    end

    # # disney example
    # it 'has "venues" as the first element' do
    #   stub_request(:get, "https://api.foursquare.com/v2/venues/search?client_id=R1TDM0FYS2YSOFTWG2QU2DS0OE00BZLMQCQPMKUGO5CJGNYH&client_secret=1N5G1D22C2410VE3RJXPS10Y31E2WA0BT45KYJFTGR0S35QN&ll=28.37777,-81.56498&query=disney&v=20160607").
    #     with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
    #     to_return(:status => 200, :body => "", :headers => {})
    #
    #   expect(subject.search_venues( "disney").keys.first).to eq ("venues")
    # end
    
    
  end

  describe '#venue' do
    # venue_id = '4ecc3303f5b90c1c343087c6'
    let(:connection) { FoursquareConnection.new(venue_id: "4ecc3303f5b90c1c343087c6") }
    subject { FoursquareVenue.new(connection: connection) }
    
    let(:fsq_query) { File.read( Rails.root + 'spec/support/fixtures/fsq_venue_disney_springs.json' ) }
    let(:target) { subject.venue }
    
    before do
      stub_request(:get, "https://api.foursquare.com/v2/venues//4ecc3303f5b90c1c343087c6?client_id=R1TDM0FYS2YSOFTWG2QU2DS0OE00BZLMQCQPMKUGO5CJGNYH&client_secret=1N5G1D22C2410VE3RJXPS10Y31E2WA0BT45KYJFTGR0S35QN&ll=28.37777,-81.56498&v=20160609").
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => fsq_query, :headers => {})
    end

    # it 'works' do
    #   expect(target).to eq("something")
    # end
    
    # # disney springs example

    it 'is an OpenStruct' do
      expect(target).to be_a(OpenStruct)
    end
    
    it 'has an id that has a length between 10 and 40 characters' do
      expect(target.id.length).to be_within(15).of(25)
    end
    
    it 'has a name that has a length more than 2 characters' do
      expect(target.name.length).to be >= 2
    end
    
    it 'has a url that has a length more than 7 characters' do
      expect(target.url.length).to be >= 7
    end
    
    # it 'has "venue" as the first element' do
    #   stub_request(:get, "https://api.foursquare.com/v2/venues/search?client_id=R1TDM0FYS2YSOFTWG2QU2DS0OE00BZLMQCQPMKUGO5CJGNYH&client_secret=1N5G1D22C2410VE3RJXPS10Y31E2WA0BT45KYJFTGR0S35QN&ll=28.37777,-81.56498&query=disney&v=20160607").
    #     with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
    #     to_return(:status => 200, :body => "", :headers => {})
    #
    #   expect(subject.venue( "disney").keys.first).to eq ("venues")
    # end
    
    
  end
  # describe '#find_review using a name foursquare.com knows' do
  #
  # end
  #
  # describe '#find_review using a name foursquare.com does _not_ know but FoursquareBridge does' do
  #
  # end
  #
  # describe '#find_review using a name foursquare.com does _not_ know and FoursquareBridge does _not_ ' do
  #
  # end
  #
  # describe '#yield_default_venue' do
  #
  # end
  #
  # describe '#_detect_desired_review with good query' do
  #
  # end
  #
  # describe '#_create_default_review' do
  #
  # end
  
  
end
