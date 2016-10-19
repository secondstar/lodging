require "representable/hash"
 
class AlbumRepresenter < Representable::Decorator
  include Representable::Hash
 
  property :name
  collection :songs, class: Song do
    property :title
  end
end