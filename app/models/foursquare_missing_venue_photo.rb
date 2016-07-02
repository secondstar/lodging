class FoursquareMissingVenuePhoto

  def id
    "none"
  end
  
  def source
    {}
  end
  
  def prefix
    ""
  end
  
  def suffix
    ""
  end
  
  def width
    0
  end
  
  def height
    0
  end
  
  def user
    
    {
    id: 'user ID for photo not available',
    firstName: "n/a",
    lastName: "n/a",
    gender: "n/a",
    photo: {
    prefix: "https://photos.wdwhub.net/",
    suffix: "/n/a.jpg"
            }
    }
  end
  
  def visibility
    "visibility n/a"
  end
  
  def foursquare_user_id
    'user ID for photo not available'
  end

  def foursquare_photo_id
    'ID for photo not available'
  end
  
end
