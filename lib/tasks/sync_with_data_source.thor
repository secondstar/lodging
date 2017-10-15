require "./config/environment"

class SyncWithDataSource < Thor
  
  desc "touring_plans", "sync cached records with touringplans.com"
  def touring_plans
    say "Updating Touring Plans reviews…", :blue
    TouringPlansHotelImport.new.save_all_remote_hotels
  end
  
  desc "foursquare_venues", "sync cached records with foursquare.com"
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

  desc "flickr_photos", "sync cached photo source uri's with flickr.com"
  def flickr_photos
    say "Updating flickr photos…", :blue
    collector = FlickrPhotoCollector.new
    photo_collection = collector.all 
    collector.cache_photos(photo_collection)
    collector._add_sizes_to_cached_photos
    collector._calculate_and_save_missing_width_height_ratios
  end
end

class AdminTask < Thor
  
  desc "update_site", "general command to update site from all sources"
  def update_site
    say "* Updating Touring Plans reviews *", :blue
    sleep(1.seconds)
    TouringPlansHotelImport.new.save_all_remote_hotels

    say "** Updating Foursquare venues **", :blue
    sleep(1.seconds)
    SyncVenue.all

    say "*** Updating Foursquare photos ***", :blue
    sleep(1.seconds)
    SyncVenue.all_photos

    say "**** Updating Foursquare tips ****", :blue
    sleep(1.seconds)
    SyncVenue.all_tips

    say "Updating flickr photos…", :blue
    collector = FlickrPhotoCollector.new
    photo_collection = collector.all 
    collector.cache_photos(photo_collection)
    collector._add_sizes_to_cached_photos
    collector._calculate_and_save_missing_width_height_ratios
    

    say "Almost there!", :red, :on_yellow
    sleep(1.seconds)

    say "Connecting new data to hotels…", :blue
    HotelSync.new.update_all_from_touringplans_com
    HotelSync.new.attach_each_foursquare_review_to_its_hotel

    say " DONE", :yellow, :on_blue
  end
  


end