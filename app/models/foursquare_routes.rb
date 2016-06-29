class FoursquareRoutes
  
  def self.routes(venue_id="")
    { search_venues: {method: "get", path: "/venues/search"},
      venue:        {method: "get", path: "/venues/#{venue_id}"},
      venue_photos:  {method: "get", path: "/venues/#{venue_id}/photos"},
      
    }
  end
end