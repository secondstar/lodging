require 'rails_helper'

RSpec.describe FlickrPhoto, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
    describe "#title" do
    # params = {path: "whispering-canyon-cafe", yql_css_parse: 'article .entry-content p' }
    # let(:target) { OpenStruct.new(params) }
    it "works" do
      expect(subject.title).to eq("i am flickr")
    end
  end
  
  describe '#search' do
    let(:search_photos_connection) { FlickrConnection.new }
    subject { FlickrConnection.new(connection: search_photos_connection) }
    
    let(:flickr_photo_search_query) { File.read( Rails.root + 'spec/support/fixtures/foursquare_venues_search_query_disney.json' ) }
    let(:search_target) { FlickrConnection.new(connection: search_photos_connection).search("Disney's Boardwalk") }

    before do
      stub_request(:get, "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=63bece2ea10c0b123eb56e38546908f2&text=Disney%27s+Boardwalk&lat=28.37777&lon=-81.56498&radius=12&format=json&nojsoncallback=1&auth_token=72157687035191330-801c3fe54e83dbb0&api_sig=ee4681b91a22d4e608aaff7fa7c30f45").
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => flickr_photo_search_query, :headers => {})
    end

    # it 'works' do
    #   expect(search_target[0]).to eq("something")
    # end

    it "works" do
      expect(FlickrPhoto.new(connection: search_photos_connection).search("Disney's Boardwalk")).to eq("something")
    end
    # # disney example
    
    # it 'is an Array' do
    #   expect(FoursquareVenue.new(connection: search_venues_connection).search_venues("disney")).to be_a(Array)
    # end
    
    # it 'contains OpenStructs' do
    #   expect(FoursquareVenue.new(connection: search_venues_connection).search_venues("disney")[0]).to be_a(OpenStruct)
    #   expect(FoursquareVenue.new(connection: search_venues_connection).search_venues("disney").last).to be_a(OpenStruct)
    # end
    
    # it 'has an OpenStruct as the first element of the Array with an id that has a length between 20 and 30 characters' do
    #   expect(FoursquareVenue.new(connection: search_venues_connection).search_venues("disney").first.id.length).to be_within(20).of(30)
    # end

    # it 'has an OpenStruct as the first element of the Array with a name that has a length more than 3 characters' do
    #   expect(FoursquareVenue.new(connection: search_venues_connection).search_venues("disney").first.name.length).to be >= 2
    # end

    # it 'has an OpenStruct as the first element of the Array with a url that has a length more than 7 characters' do
    #   expect(FoursquareVenue.new(connection: search_venues_connection).search_venues("disney").first.url.length).to be >= 7
    # end
  end

end
