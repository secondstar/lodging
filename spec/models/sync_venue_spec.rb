require 'rails_helper'

RSpec.describe SyncVenue, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe "#_collect_venue_ids" do
    
  end

  describe '#_collect_uris_and_search_terms' do
    subject { SyncVenue._collect_uris_and_search_terms }
    let(:tp_hotels) { File.read( Rails.root + 'spec/support/fixtures/tp_hotels.html' ) }
    let(:fsq_contemporay_baylake_tower) { File.read( Rails.root +
       'spec/support/fixtures/bay-lake-tower-at-contemporary.json' ) }
    let(:fsq_all_star_movies_query) { File.read( Rails.root + 'spec/support/fixtures/all-star-movies.json' ) }
    
    
    before do
      stub_request(:get, "https://api.foursquare.com/v2/venues/search/?client_id=#{FOURSQUARE_ID}&client_secret=#{FOURSQUARE_SECRET}&ll=28.37777,-81.56498&query=disneyworld.disney.go.com/resorts/all-star-movies-resort/%20resort&v=20160607&verified=true").
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => "", :headers => {})
    
      
      stub_request(:get, "https://api.foursquare.com/v2/venues/search/?client_id=R1TDM0FYS2YSOFTWG2QU2DS0OE00BZLMQCQPMKUGO5CJGNYH&client_secret=1N5G1D22C2410VE3RJXPS10Y31E2WA0BT45KYJFTGR0S35QN&ll=28.37777,-81.56498&query=disneyworld.disney.go.com/resorts/all-star-music-resort/%20resort&v=20160607&verified=true").
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => fsq_all_star_movies_query, :headers => {})
    
        stub_request(:get, "https://api.foursquare.com/v2/venues/search/?client_id=#{FOURSQUARE_ID}&client_secret=#{FOURSQUARE_SECRET}&ll=28.37777,-81.56498&query=disneyworld.disney.go.com/resorts/bay-lake-tower-at-contemporary/%20resort&v=20160607&verified=true").
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => fsq_contemporay_baylake_tower, :headers => {})
      
      stub_request(:get, "https://touringplans.com/walt-disney-world/hotels/websites").
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => tp_hotels, :headers => {})

      stub_request(:get, "https://touringplans.com/walt-disney-world/hotels/websites").
         with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
         to_return(:status => 200, :body => "", :headers => {})        
    end
    
    it 'works' do
      expect(subject).to eq("something")
    end
    
    it 'returns an Array' do
      expect(subject).to be_an(Array)
    end

    it 'returns an Array with a length 30, give or take 29' do
      expect(subject.length).to be_within(29).of(30)
    end
    
    it 'has a string as the first element' do
      expect(subject.first).to be_a(String)
    end

    it 'has a string as the last element' do
      expect(subject.last).to be_a(String)
    end

  end
  
  describe '#_wdw_uris' do
    subject { SyncVenue._wdw_uris }
    let(:tp_hotels) { File.read( Rails.root + 'spec/support/fixtures/tp_hotels.html' ) }
    
    before do
      stub_request(:get, "https://touringplans.com/walt-disney-world/hotels/websites").
        with(:headers => 
          {'Accept'=>'*/*', 
            'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 
            'User-Agent'=>'Ruby'
            }
        ).
        to_return(:status => 200, :body => tp_hotels, :headers => {})
      end
    # it 'works' do
    #   expect(subject).to eq("something")
    # end
    
    it 'is an Array' do
      expect(subject).to be_an(Array)
    end
    
    it 'has a length 5 within a 30' do
      expect(subject.length).to be_within(5).of(30)
    end
  end
  
  describe '#_get_path_of_uri' do
    let(:nogo_array) { ["none","http://disneyworld.disney.go.com/resorts/all-star-movies-resort/"] }
    subject { SyncVenue._get_path_of_uri(nogo_array) }
    
    it 'works' do
      expect(SyncVenue._get_path_of_uri(nogo_array)).to       eq("all-star-movies-resort")
    end
    
    it 'returns a String from  an Array' do
      expect(subject).to be_a(String)
    end
  end

  describe '#_correct_nogos_and_return_ids(nogos_arrays_list)' do
    let(:fsq_all_star_movies_query) { File.read( Rails.root + 'spec/support/fixtures/all-star-movies.json' ) }
    let(:fsq_contemporary_baylake) { File.read( Rails.root + 'spec/support/fixtures/bay-lake-tower-at-contemporary.json' ) }
    
    let(:nogos_arrays_list) { [["none", "disneyworld.disney.go.com/resorts/all-star-movies-resort/"], ["none",  "disneyworld.disney.go.com/resorts/bay-lake-tower-at-contemporary"] ] }
    # subject(SyncVenue._correct_nogos(nogos_arrays_list))
    
    before do
      stub_request(:get, "https://api.foursquare.com/v2/venues/search/?client_id=#{FOURSQUARE_ID}&client_secret=#{FOURSQUARE_SECRET}&ll=28.37777,-81.56498&query=bay-lake-tower-at-contemporary%20resort&v=20160607&verified=true").
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => fsq_contemporary_baylake, :headers => {})
      
      stub_request(:get, "https://api.foursquare.com/v2/venues/search/?client_id=#{FOURSQUARE_ID}&client_secret=#{FOURSQUARE_SECRET}&ll=28.37777,-81.56498&query=all-star-movies-resort%20resort&v=20160607&verified=true").
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => fsq_all_star_movies_query, :headers => {})
      
      
    end
    it 'works' do
      expect(SyncVenue._correct_nogos_and_return_ids(nogos_arrays_list)).to eq(["4b527e95f964a520ce7f27e3","4b9b0114f964a520ffea35e3"])
    end
    
    it 'returns an Array' do
      expect(SyncVenue._correct_nogos_and_return_ids(nogos_arrays_list)).to be_an(Array)
    end

    it 'returns a String for the first element of the Array' do
      expect(SyncVenue._correct_nogos_and_return_ids(nogos_arrays_list)[0]).to be_an(String)
    end

    it 'returns a String for the last element of the Array' do
      expect(SyncVenue._correct_nogos_and_return_ids(nogos_arrays_list).last).to be_an(String)
    end

  end
end
