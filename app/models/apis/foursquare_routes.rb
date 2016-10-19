class FoursquareRoutes
  
  def self.routes(venue_id="")
    { search_venues: {method: "get", path: "/venues/search"},
      venues:        {method: "get", path: "/venues"},
      venue_photos:  {method: "get", path: "/venues/#{venue_id}"},
      
    }
  end
end