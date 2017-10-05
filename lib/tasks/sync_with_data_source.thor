require "./config/environment"

class SyncWithDataSource < Thor
  
  desc "touring_plans", "sync cached records with touringplans.com"
  def touring_plans
    say "Updating Touring Plans reviews…", :blue
    TouringPlansHotelImport.new.save_all_remote_hotels
  end
  
  desc "2_foursquare_venues", "sync cached records with foursquare.com"
  def foursquare_venues
    say "Updating Foursquare venues…", :blue
    SyncVenue.all
  end

  desc "foursquare_photos", "sync cached photos with foursquare.com"
  def foursquare_photos
    say "Updating Foursquare photos…", :blue
    SyncVenue.all_photos
  end

  desc "update_hotels", "update hotels with cached data"
  def update_hotels
    say "Updating hotels…", :blue
    HotelSync.new.update_all_from_touringplans_com
    HotelSync.new.attach_each_foursquare_review_to_its_hotel
  end

  desc "foursquare_tips", "sync cached tips with foursquare.com"
  def foursquare_tips
    say "Updating Foursquare tips…", :blue
    SyncVenue.all_tips
  end


end