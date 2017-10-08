require 'rails_helper'

RSpec.describe FlickrClient, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  connection = FlickrConnection.new
  query      = connection.query(:text=>"Disney's Boardwalk",
 				:api_key => FLICKR_ID)
  subject { FlickrClient.new(connection: connection, routes: FlickrRoutes.routes)
  }

  describe "#title" do
    it "works" do
      expect(subject.title).to eq("i am flickr")
    end
  end

  describe 'given route, client returns expected results' do
    
    let(:flickr_query) { File.read( Rails.root + 'spec/support/fixtures/flickr_photos_search_disneys_boardwalk.json' ) }
    
    before do
      stub_request(:get, "https://api.flickr.com/services/rest?api_key=63bece2ea10c0b123eb56e38546908f2&format=json&lat=28.376129084095446&lon=-81.56383223831654&method=flickr.photos.search&nojsoncallback=1&query=Disney's%20Boardwalk&radius=12").
               with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
               to_return(:status => 200, :body => flickr_query, :headers => {})    
    end
    
    it 'works' do
      expect(subject.parsed_response).to eq("something")
    end
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
