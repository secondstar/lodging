require 'representable/json'

class FoursquareRepresenter < Representable::Decorator
  include Representable::JSON

  property :id
  property :name
  property :contact
  property :location
  property :categories
  property :verified
  property :stats
  property :url
  property :delivery
  property :allowMenuUrlEdit
  property :specials
  property :hereNow
  property :referralId
  property :venueChains
end