class AddPermalinkToHotel < ActiveRecord::Migration
  def change
    add_column :hotels, :permalink, :text
  end
end
