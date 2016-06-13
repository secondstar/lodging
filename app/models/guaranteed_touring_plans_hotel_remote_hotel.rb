class GuaranteedTouringPlansHotelRemoteHotel

  def self.find_by_permalink(permalink)
    TouringPlansRemoteHotel.new.find_by_permalink(permalink.to_s) || MissingTouringPlansHotel.new(permalink.to_s)
  end
end