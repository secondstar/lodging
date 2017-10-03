require 'rails_helper'

RSpec.describe FoursquareVenue do

  describe "#title" do
    # params = {path: "whispering-canyon-cafe", yql_css_parse: 'article .entry-content p' }
    # let(:target) { OpenStruct.new(params) }
    it "works" do
      expect(subject.title).to eq("i am foursquare")
    end
  end
  
  describe '#venue' do
    # venue_id = '4ecc3303f5b90c1c343087c6'
    # let(:venue_connection) { FoursquareConnection.new(venue_id: "4ecc3303f5b90c1c343087c6") }
    subject { FoursquareVenue.new(connection: FoursquareConnection.new(venue_id: "4ecc3303f5b90c1c343087c6")) }
    let(:fsq_disney_springs_query) { File.read( Rails.root + 'spec/support/fixtures/fsq_venue_disney_springs.json' ) }
    let(:fsq_venue_detail_connection) { FoursquareConnection.new(venue_id: "4ecc3303f5b90c1c343087c6", query: {}) }
    
    before do
      stub_request(:get, "https://api.foursquare.com/v2/venues//4ecc3303f5b90c1c343087c6?client_id=#{FOURSQUARE_ID}&client_secret=#{FOURSQUARE_SECRET}&ll=28.37777,-81.56498&v=20160609").
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => fsq_disney_springs_query, :headers => {})
      
    end

    # it 'works' do
    #   expect(subject.venue).to eq("something")
    # end
    
    # # disney springs example

    it 'is an OpenStruct' do
      expect(FoursquareVenue.new(connection: fsq_venue_detail_connection).venue).to be_a(OpenStruct)
    end
    
    it 'has an id that has a length between 10 and 40 characters' do
      expect(FoursquareVenue.new(connection: fsq_venue_detail_connection).venue.id.length).to be_within(15).of(25)
    end
    
    it 'has a name that has a length more than 2 characters' do
      expect(FoursquareVenue.new(connection: fsq_venue_detail_connection).venue.name.length).to be >= 2
    end
    
    it 'has a url that has a length more than 7 characters' do
      expect(FoursquareVenue.new(connection: fsq_venue_detail_connection).venue.url.length).to be >= 7
    end
    
    # it 'has "venue" as the first element' do
    #   stub_request(:get, "https://api.foursquare.com/v2/venues/search?client_id=R1TDM0FYS2YSOFTWG2QU2DS0OE00BZLMQCQPMKUGO5CJGNYH&client_secret=1N5G1D22C2410VE3RJXPS10Y31E2WA0BT45KYJFTGR0S35QN&ll=28.37777,-81.56498&query=disney&v=20160607").
    #     with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
    #     to_return(:status => 200, :body => "", :headers => {})
    #
    #   expect(subject.venue( "disney").keys.first).to eq ("venues")
    # end
    
    
  end
  
  
  describe '#search_venues' do
    let(:search_venues_connection) { FoursquareConnection.new }
    subject { FoursquareVenue.new(connection: search_venues_connection) }
    
    let(:fsq_venues_search_query) { File.read( Rails.root + 'spec/support/fixtures/foursquare_venues_search_query_disney.json' ) }
    let(:search_target) { FoursquareVenue.new(connection: search_venues_connection).search_venues("disney") }

    before do
      stub_request(:get, "https://api.foursquare.com/v2/venues/search/?client_id=#{FOURSQUARE_ID}&client_secret=#{FOURSQUARE_SECRET}&ll=28.37777,-81.56498&query=disney%20resort&v=20160609").
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => fsq_venues_search_query, :headers => {})
    end

    # it 'works' do
    #   expect(search_target[0]).to eq("something")
    # end

    # it "works" do
    #   expect(FoursquareVenue.new(connection: search_venues_connection).search_venues("disney")).to eq("something")

    # end
    # # disney example
    
    it 'is an Array' do
      expect(FoursquareVenue.new(connection: search_venues_connection).search_venues("disney")).to be_a(Array)
    end
    
    it 'contains OpenStructs' do
      expect(FoursquareVenue.new(connection: search_venues_connection).search_venues("disney")[0]).to be_a(OpenStruct)
      expect(FoursquareVenue.new(connection: search_venues_connection).search_venues("disney").last).to be_a(OpenStruct)
    end
    
    it 'has an OpenStruct as the first element of the Array with an id that has a length between 20 and 30 characters' do
      expect(FoursquareVenue.new(connection: search_venues_connection).search_venues("disney").first.id.length).to be_within(20).of(30)
    end

    it 'has an OpenStruct as the first element of the Array with a name that has a length more than 3 characters' do
      expect(FoursquareVenue.new(connection: search_venues_connection).search_venues("disney").first.name.length).to be >= 2
    end

    it 'has an OpenStruct as the first element of the Array with a url that has a length more than 7 characters' do
      expect(FoursquareVenue.new(connection: search_venues_connection).search_venues("disney").first.url.length).to be >= 7
    end
  end

  
end
