class RenameColumnUrlinHoteltoWdwUri < ActiveRecord::Migration
  def change
    rename_column :hotels, :url, :wdw_uri
    
  end
end
