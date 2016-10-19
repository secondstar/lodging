# class Apis::Client
#   attr_reader :connection, :routes
#
#   def initialize(connection:, routes:)
#     @connection   = connection
#     @routes       = routes
#   end
#
#   def method_missing(method, *request_arguments)
#
#     # retrieve the route map
#     route_map = routes.fetch(method)
#
#     # make request via the connection
#     response_from_route(route_map, request_arguments)
#   end
#
#   def title
#     "i am foursquare"
#   end
#
#   # def search_reviews(query = "")
#   #   reviews = client.search_venues(
#   #       query:      query,
#   #       categoryId: @categoryId,
#   #       radius:     @search_radius
#   #       )
#   #   review = reviews
#   # end
#
#   # def client
#   #   client = Foursquare2::Client.new(:client_id => @client_id,
#   #       :client_secret => @client_secret,
#   #       :api_version => @api_version)
#   # end
#   #
#   private
#
#   attr_reader :connection, :routes
#
#   def response_from_route(route_map, request_arguments)
#
#     # gather the routes required parameters
#     http_method   = route_map.fetch(:method)
#     relative_path = route_map.fetch(:path)
#
#     # call the connection for records
#     connection.send(http_method, relative_path, *request_arguments)
#   end
#
# end