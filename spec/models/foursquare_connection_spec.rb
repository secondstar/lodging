require 'rails_helper'

RSpec.describe FoursquareConnection do
  subject { FoursquareConnection.new
  }

  describe "#title" do
    # params = {path: "whispering-canyon-cafe", yql_css_parse: 'article .entry-content p' }
    # let(:target) { OpenStruct.new(params) }
    it "works" do
      expect(subject.title).to eq("i am foursquare")
    end
  end
  
  describe '#query({})' do
    # it 'works' do
    #   expect(subject.query).to eq("something")
    # end
    it 'returns the minimum params when none are supplied' do
      expect(subject.query).to include(:client_id, :client_secret, :v, :ll)
    end
  end
  
  describe "#query({query:'disney'})" do
    it 'returns the query param and the other miniumum params' do
      expect(subject.query({query:'disney'}).keys).to eq([:query,:client_id, :client_secret, :v, :ll])
      # expect(subject.query({:query => ''}).to eq("something"))
    end
    
    it 'returns the search term in query param' do
      expect(subject.query({query:'disney'})).to include(:query => 'disney')
      
    end
  end
  
  describe '#get' do
    let(:relative_path) { "/venues/search" }
    let(:query) { subject.query({query:'disney'}) }
    let(:fsq_query) { File.read( Rails.root + 'spec/support/fixtures/foursquare_venues_search_query_disney.json' ) }

    before do
      stub_request(:get, "https://api.foursquare.com/v2/venues/search/?client_id=#{FOURSQUARE_ID}&client_secret=#{FOURSQUARE_SECRET}&ll=28.37777,-81.56498&query=disney&v=20160609").
               with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
               to_return(:status => 200, :body => fsq_query, :headers => {})    
    end
    
    
    # it 'works' do
    #   expect(subject.get(relative_path ,query)).to eq("something")
    #
    # end
    
    it 'returns a hash' do
      target = subject.get(relative_path ,query).parsed_response
      expect(target).to be_a_kind_of(Hash)
    end
    
    it 'returns between 1 and 30 venues' do
      target = subject.get(relative_path ,query).parsed_response.fetch("response").fetch('venues')
      expect(target.length).to be_within(1).of(30)
    end
  end

  #
  # describe '#the_relative_path' do
  #
  # end
end
