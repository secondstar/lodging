require 'rails_helper'

RSpec.describe Foursquare2Client, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  
  subject { Foursquare2Client.new
  }

  describe "#title" do
    # params = {path: "whispering-canyon-cafe", yql_css_parse: 'article .entry-content p' }
    # let(:target) { OpenStruct.new(params) }
    it "works" do
      expect(subject.title).to eq("i am foursquare2")
    end
  end
  
  describe '#client' do
    
    # it 'works' do
    #   expect(subject.client).to eq("something")
    # end
    
    it 'returns the default client_id' do
      expect(subject.client_id).to be_a(String)
    end
    
    it 'returns the default client_secret' do
      expect(subject.client_secret).to be_a(String)
    end
    
    # :api_version => self.api_version, :ll => self.ll
    
    it 'returns the lat and latitude' do
      expect(subject.ll).to be_a(String)
    end
  end
end
