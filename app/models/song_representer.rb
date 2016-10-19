require 'representable/json'

class SongRepresenter < Representable::Decorator
  include Representable::JSON

  property :title
  property :track
  collection :composers
end