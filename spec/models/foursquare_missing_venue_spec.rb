require 'rails_helper'

RSpec.describe FoursquareMissingVenue, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  subject { FoursquareMissingVenue.new }

  describe '#name ' do
    it 'returns "default venue"' do
      expect(subject.name).to eq("default venue")
    end
  end
  describe '#categories' do
    #<Hashie::Mash icon=#<Hashie::Mash prefix="https://ss3.4sqi.net/img/categories_v2/travel/busstation_" suffix=".png"> id="" name="" pluralName="" primary=true shortName="">
    let(:cat) { subject.categories }

    # it 'does something' do
    #   expect(cat).to eq("something")
    # end

    # it 'is a Hashie::Mash ' do
    #   cat.must_be_kind_of Hashie::Mash
    # end
    #
    # it 'has icon as a Hashie::Mash ' do
    #   cat.icon.must_be_kind_of Hashie::Mash
    # end
    #
    # it 'has icon prefix as an static String ' do
    #   cat.icon.prefix.must_equal "https://ss3.4sqi.net/img/categories_v2/travel/busstation_"
    # end
    #
    # it 'has icon prefix as an static String ' do
    #   cat.icon.suffix.must_equal ".png"
    # end
    #
    # it 'has an id as a empty string ' do
    #   cat.id.must_equal ""
    # end
    #
    # it 'has a pluralName as a empty string ' do
    #   cat.pluralName.must_equal ""
    # end
    #
    # it 'has primary as true ' do
    #   cat.primary.must_equal true
    # end
    #
    # it 'has a pluralName as a empty string ' do
    #   cat.shortName.must_equal ""
    # end

  end

  describe '#location' do
    # location=#<Hashie::Mash cc="US" city="Lake Buena Vista" country="United States" crossStreet="all over Walt Disney World" distance=182 formattedAddress=["all over Walt Disney World", "Lake Buena Vista, FL 32830", "United States"] lat=28.37852393229888 lng=-81.56662923700945 postalCode="32830" state="FL">

    let(:loc) { subject.location }

    # it 'does something' do
    #   expect(loc).to eq("someting")
    # end

  #   it 'is a kind of Hashie::Mash ' do
  #     loc.must_be_kind_of Hashie::Mash
  #   end

    it 'has a length of 10 ' do
      # expect(loc.length).to eq(10)
      # loc.length.must_equal 10
    end

    it 'has a float for the lat ' do
      # loc.lat.must_be_kind_of Float
    end

    it 'has a float for the lng ' do
      # expect(loc.lng).to be_a(String)
    end

    it 'has an array for formattedAddress ' do
      # expect(loc.formattedAddress).to be_a(String)
    end
  end

  describe '#id' do
    it 'is a String ' do
      expect(subject.id).to be_a(String)
    end
  end

  describe '#referral_id' do
    it 'is a String ' do
      expect(subject.referral_id).to be_a(String)
    end
  end

  # describe '#specials' do
  #   it 'is a kind of Hashie::Mash ' do
  #     subject.specials.must_be_kind_of Hashie::Mash
  #   end
  # end
  #
  # describe '#stats' do
  #   it 'is a kind of Hashie::Mash' do
  #     subject.stats.must_be_kind_of Hashie::Mash
  #   end
  # end
  #
  # describe '#verified' do
  #   it 'is a kind of FalseClass' do
  #     subject.verified.must_be_kind_of FalseClass
  #   end
  #
  # end
  
end
