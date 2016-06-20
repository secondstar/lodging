require 'rails_helper'

RSpec.describe FoursquareConnection do
  DEFAULT_API_VERSION     = "20160609"
  subject { FoursquareConnection.new(
    client_id: 'foursquare id here', 
    client_secret: "i am a secret", 
    api_version:    DEFAULT_API_VERSION) 
  }

  describe "#title" do
    # params = {path: "whispering-canyon-cafe", yql_css_parse: 'article .entry-content p' }
    # let(:target) { OpenStruct.new(params) }
    it "works" do
      expect(subject.title).to eq("i am foursquare")
    end
  end
  
  describe '#params' do
    it 'returns default params {} when none ar supplied' do
      
    end
  end
  describe '#routes' do
    
  end
  
  
end
