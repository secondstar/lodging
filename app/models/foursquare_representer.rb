# require "representable/object"
require 'representable/json'
require 'representable/hash'
 

class FoursquareRepresenter < Representable::Decorator
  # include Representable::Object
  include Representable::JSON
  include Representable::Hash
  
  

  property :id
  property :name
  property :verified
  property :url
  property :hasMenu
  property :allowMenuUrlEdit
  property :referralId
  # nested :location do
  #   property :address
  # end
  
  
  nested :location do
    property :address
    property :lat
    property :lng
    property :distance
    property :postalCode
    property :cc
    property :city
    property :state
    property :country
    property :state
    property :formattedAddress
  end
end