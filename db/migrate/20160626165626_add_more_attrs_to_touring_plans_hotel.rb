class AddMoreAttrsToTouringPlansHotel < ActiveRecord::Migration
  def change
    add_column :touring_plans_hotels, :address, :text
    add_column :touring_plans_hotels, :city, :string
    add_column :touring_plans_hotels, :state_code, :string
    add_column :touring_plans_hotels, :zip_code, :string
    add_column :touring_plans_hotels, :phone_number, :string
    add_column :touring_plans_hotels, :url, :string
    add_column :touring_plans_hotels, :off_site, :boolean
    add_column :touring_plans_hotels, :water_sports, :boolean
    add_column :touring_plans_hotels, :marina, :boolean
    add_column :touring_plans_hotels, :beach, :boolean
    add_column :touring_plans_hotels, :tennis, :boolean
    add_column :touring_plans_hotels, :biking, :boolean
    add_column :touring_plans_hotels, :suites, :boolean
    add_column :touring_plans_hotels, :concierge_floor, :boolean
    add_column :touring_plans_hotels, :room_service, :boolean
    add_column :touring_plans_hotels, :wired_internet, :boolean
    add_column :touring_plans_hotels, :wireless_internet, :boolean
    add_column :touring_plans_hotels, :num_rooms, :integer
    add_column :touring_plans_hotels, :cost_range, :string
    add_column :touring_plans_hotels, :shuttle_to_parks, :string
    add_column :touring_plans_hotels, :cost_estimate, :string
    add_column :touring_plans_hotels, :lodging_area_code, :string
    add_column :touring_plans_hotels, :category_code, :string
    add_column :touring_plans_hotels, :theme, :string
    
  end
end
