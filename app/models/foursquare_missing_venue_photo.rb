class FoursquareMissingVenuePhoto

  #<OpenStruct id="55f0302c498ee9b78dea631d", createdAt=1441804332, source=#<Hashie::Mash name="Instagram" url="http://instagram.com">, prefix="https://irs1.4sqi.net/img/general/", suffix="/807192_MlbX3Qpt2cYj5gEAO86fcnQhwXEO5LA8i3Qa6nfhgOk.jpg", width=1080, height=1080, user=#<Hashie::Mash firstName="Emily" gender="female" id="807192" lastName="Munn" photo=#<Hashie::Mash prefix="https://irs3.4sqi.net/img/user/" suffix="/YLORETPBD30DKOSS.jpg">>, visibility="public">


  def id
    "none"
  end
  
  def created_at
    0.to_i
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

  def photographer_first_name
    ""
  end
  
  def photographer_last_name
    ""
  end
  
  def photographer_prefix
    ""
  end
  
  def photographer_suffix
    ""
  end
  
  def photographer_photo
    ""
  end
  
  def visibility
    ""
  end
end
