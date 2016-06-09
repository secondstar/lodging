class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state_code
      t.string :zip_code
      t.string :phone_number
      t.string :url
      t.boolean :off_site
      t.boolean :water_sports
      t.boolean :marina
      t.boolean :beach
      t.boolean :tennis
      t.boolean :biking
      t.boolean :suites
      t.boolean :concierge_floor
      t.boolean :room_service
      t.boolean :wired_internet
      t.boolean :wireless_internet
      t.integer :num_rooms
      t.string :cost_range
      t.string :shuttle_to_parks
      t.string :cost_estimate
      t.string :lodging_area_code
      t.string :category_code

      t.timestamps null: false
    end
  end
end
