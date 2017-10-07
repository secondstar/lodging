class FlickrConnection
	  include HTTParty
  format :json
  # example xml url: https://api.flickr.com/services/rest/
  # 			?method=flickr.photos.search
  # 			&api_key=FLICKR_ID
  # 			&text=Disney%27s+Boardwalk
  # 			&format=rest
  # 			&auth_token=72157687516646044-13aabae10ac80bba
  # 			&api_sig=d5bd0f520a924f35167f04d4959378f4

  # example json url:
  # 			https://api.flickr.com/services/rest/
  # 			?method=flickr.photos.search
  # 			&api_key=FLICKR_ID
  # 			&text=Disney%27s+Boardwalk
  # 			&format=json
  # 			&nojsoncallback=1
  # 			&auth_token=72157687516646044-13aabae10ac80bba
  # 			&api_sig=6a0c05998ecbf0194d7e7eb3fae53724

  # DEFAULT_BASE_API_VERSION  = '2'
  # DEFAULT_API_VERSION       = "20160609"
  DEFAULT_BASE_URI          = "https://api.flickr.com/services"
  DEFAULT_QUERY             = {}
  DEFAULT_LAT_AND_LNG       = '28.37777,-81.56498'
  DEFAULT_RADIUS            = '12'
  DEFAULT_FLICKR_ID         = FLICKR_ID
  DEFAULT_FLICKR_METHOD     = 'flickr.photos.search'

  base_uri DEFAULT_BASE_URI

  attr_reader :connection

  def initialize(options={})
    # @api_version = options.fetch(:api_version, DEFAULT_API_VERSION)
    @api_key	         = options.fetch(:credentials, DEFAULT_FLICKR_ID)
    @lat      	       = options.fetch(:lat, FLICKR_DEFAULT_LAT)
    @lon      	       = options.fetch(:lon, FLICKR_DEFAULT_LON)
    @radius   	       = options.fetch(:radius, 12)
    @method            = DEFAULT_FLICKR_METHOD
    @nojsoncallback    = 1
    @format            = "json"

    @query 			= options.fetch(:query, DEFAULT_QUERY)
    @connection 	= self.class
  end

  def title
  	"i am flickr"
  end

  def query(params={})
    @query.update(params)
    api_key           	= [:api_key, @api_key]
    lat                	= [:lat, @lat]
    lon                 = [:lon, @lon]
    radius              = [:radius, @radius]
    method              = [:method, @method]
    nojsoncallback      = [:nojsoncallback, @nojsoncallback]
    format              = [:format, @format]
    key_value_pairs     = [api_key, lat, lon, radius, method, nojsoncallback, format]
    required_keys_hash  = Hash[key_value_pairs]
    required_keys_hash

    @query.merge(required_keys_hash)
  end

  def get(relative_path, query={})
    # relative_path = add_api_version(relative_path)
    connection.get relative_path, query: @query.merge(query)
  end


  ## flickr  currently does not have an api version
  # def add_api_version(relative_path)
  #   "/#{api_version_path}#{relative_path}"
  # end

  # def api_version_path
  #   "v" + @api_version.to_s
  # end

end