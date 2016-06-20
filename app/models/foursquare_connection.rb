class FoursquareConnection
  include HTTParty
  format :json
  

  DEFAULT_API_VERSION = "20160609"
  DEFAULT_BASE_URI    = "https://api.foursquare.com/v2/venues/search?"
  DEFAULT_QUERY       = {}
  DEFAULT_LAT_AND_LNG = '28.37777,-81.56498'

  base_uri DEFAULT_BASE_URI

  def initialize(options={})
    @api_version = options.fetch(:api_version, DEFAULT_API_VERSION)
    @query       = options.fetch(:query, DEFAULT_QUERY)
    @lat_and_lng = options.fetch(:lat_and_lng, DEFAULT_LAT_AND_LNG)
    @connection  = self.class
  end

  def query(params={})
    @query.update(params)
  end

  def get(relative_path, query={})
    relative_path = add_api_version(relative_path)
    connection.get relative_path, query: @query.merge(query)
  end

  private

  attr_reader :connection

  def add_api_version(relative_path)
    "#{api_version_path}#{relative_path}"
  end

  def api_version_path
    "v=#{@api_version}&m=foursquare&ll=#{@lat_and_lng}"
  end

end