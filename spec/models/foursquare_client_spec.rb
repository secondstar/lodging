require 'rails_helper'
ROUTES = FoursquareRoutes.routes

RSpec.describe FoursquareClient do
  connection = FoursquareConnection.new
  query      = connection.query(:query=>"disney",
 :client_id=> connection.client_id,
 :client_secret=> connection.client_secret,
 :v=> connection.api_version,
 :ll=> connection.lat_and_lng)
  subject { FoursquareClient.new(connection: connection, routes: ROUTES)
  }

  describe "#title" do
    it "works" do
      expect(subject.title).to eq("i am foursquare")
    end
  end

  describe 'given route, client returns expected results' do
    
    let(:fsq_query) { File.read( Rails.root + 'spec/support/fixtures/fourscore_venues_search_query_disney.json' ) }
    
    before do
      stub_request(:get, "https://api.foursquare.com/v2/venues/search?client_id=R1TDM0FYS2YSOFTWG2QU2DS0OE00BZLMQCQPMKUGO5CJGNYH&client_secret=1N5G1D22C2410VE3RJXPS10Y31E2WA0BT45KYJFTGR0S35QN&ll=28.37777,-81.56498&query=disney&v=20160609").
               with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
               to_return(:status => 200, :body => fsq_query, :headers => {})    
    end
    
    # it 'works' do
    #   expect(subject.search_venues.parsed_response.fetch('response').fetch('venues')).to eq("something")
    # end
    it 'returns an array within hash' do
      target = subject.search_venues.parsed_response.fetch('response').fetch('venues')
      expect(target).to be_a_kind_of(Array)
    end
    
    it 'returns between 1 and 30 venues' do
      target = subject.search_venues.parsed_response.fetch('response').fetch('venues')
      expect(target.length).to be_within(1).of(30)
    end
  end
end
