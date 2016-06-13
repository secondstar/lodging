class TouringPlansRemoteHotel
  attr_reader :source_index_uri
  def initialize(data_source: TouringPlansComFeed.new)
    @data_source = data_source
  end

  def find_by_permalink(permalink)
    @data_source.get_hotel_details_by_permalink(permalink)
  end
  
end