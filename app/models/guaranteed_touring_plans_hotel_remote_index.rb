class GuaranteedTouringPlansHotelRemoteIndex
  
  def self.find_all
    TouringPlansComFeed.new.collect_list_of_disney_hotels || MissingTouringPlansRemoteIndex.new 
  end
end