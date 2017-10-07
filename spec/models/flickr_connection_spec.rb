require 'rails_helper'

RSpec.describe FlickrConnection, type: :model do
	  subject { FlickrConnection.new
  }

  describe "#title" do
    # params = {path: "whispering-canyon-cafe", yql_css_parse: 'article .entry-content p' }
    # let(:target) { OpenStruct.new(params) }
    it "works" do
      expect(subject.title).to eq("i am flickr")
    end
  end

  describe '#query({})' do
    # it 'works' do
    #   expect(subject.query).to eq("something")
    # end
    it 'returns the minimum params when none are supplied' do
      expect(subject.query).to include(:api_key, :lat, :lon, :method, :nojsoncallback, :format)
    end
  end

  describe '#get' do
    let(:relative_path) { "/rest" }
    let(:query) { subject.query({query:"Disney's Boardwalk"}) }
    let(:flickr_query) { File.read( Rails.root + 'spec/support/fixtures/flickr_photos_search_disneys_boardwalk.json' ) }

    before do
      stub_request(:get, "https://api.flickr.com/services/rest?api_key=63bece2ea10c0b123eb56e38546908f2&format=json&lat=28.376129084095446&lon=-81.56383223831654&method=flickr.photos.search&nojsoncallback=1&query=Disney's%20Boardwalk&radius=12").
               with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
               to_return(:status => 200, :body => flickr_query, :headers => {})    
    end
    
    
    # it 'works' do
    #   expect(subject.get(relative_path ,query)).to eq("something")
    
    # end
    
    it 'returns a hash' do
      target = subject.get(relative_path ,query).parsed_response
      expect(target).to be_a_kind_of(Hash)
    end
    
  end

end
