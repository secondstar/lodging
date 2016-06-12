class AddPermalinkToTouringPlansHotel < ActiveRecord::Migration
  def change
    add_column :touring_plans_hotels, :permalink, :text
  end
end
