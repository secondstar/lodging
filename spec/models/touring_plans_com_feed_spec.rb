require 'rails_helper'

require_relative '../../app/models/touring_plans_com_feed'
require "ostruct"

RSpec.describe TouringPlansComFeed, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  
  describe '#collect_list_of_disney_hotels' do
    let(:hotel_index) { File.read( Rails.root + 'spec/support/fixtures/tp_hotels.html' ) }
    let(:source_index_uri) { "https://touringplans.com/walt-disney-world/hotels" }
    subject { TouringPlansComFeed.new.collect_list_of_disney_hotels }

    before do
      stub_request(:get, "https://touringplans.com/walt-disney-world/hotels").
        with(:headers => {'Accept'=>'*/*', 
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 
          'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => hotel_index, :headers => {})
    end

    it 'is an Array' do
      # expect(subject).to have_content("Art of Animation Resort")
      expect(subject).to be_an(Array)
    end
    
    it 'has roughly 55 elements' do
      expect(subject.length).to be_within(5).of(55)
    end
    
    it 'renders a string for each element' do
      expect(subject.first).to be_a(Hash)
    end    
  end
  
  describe '#get_hotel_details_by_permalink with 200 response code' do
    let(:permalink) { "disneys-art-of-animation-resort" }
    let(:hotel) { File.read( Rails.root + 'spec/support/fixtures/tp_art_of_animation.html' ) }
    
    subject { TouringPlansComFeed.new.get_hotel_details_by_permalink(permalink) }

    it 'is a Hash' do
      stub_request(:get, "https://touringplans.com/walt-disney-world/hotels/disneys-art-of-animation-resort.json?output=json").
         with(:headers => {'Accept'=>'*/*',
           'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 
           'User-Agent'=>'Ruby'}).
         to_return(:status => 200, :body => hotel, :headers => {})

      expect(subject).to be_a(Hash)
    end

    it "returns 25 items in the hash" do
      stub_request(:get, "https://touringplans.com/walt-disney-world/hotels/disneys-art-of-animation-resort.json?output=json").
         with(:headers => {'Accept'=>'*/*',
           'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 
           'User-Agent'=>'Ruby'}).
         to_return(:status => 200, :body => hotel, :headers => {})

      expect(subject.length).to be == 25
    end
    
    it 'has a link to the disneyworld website' do
      stub_request(:get, "https://touringplans.com/walt-disney-world/hotels/disneys-art-of-animation-resort.json?output=json").
         with(:headers => {'Accept'=>'*/*',
           'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 
           'User-Agent'=>'Ruby'}).
         to_return(:status => 200, :body => hotel, :headers => {})
      
      expect(subject['url']).to include("disneyworld.disney.go.com\/resorts")
    end
    
    it 'has a name' do
      stub_request(:get, "https://touringplans.com/walt-disney-world/hotels/disneys-art-of-animation-resort.json?output=json").
         with(:headers => {'Accept'=>'*/*',
           'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 
           'User-Agent'=>'Ruby'}).
         to_return(:status => 200, :body => hotel, :headers => {})
      
      # subject["name"].must_equal "Mr. Kamal's"
      expect(subject["name"]).to eq("Disney's Art of Animation Resort")
    end
  end
  
  
end
