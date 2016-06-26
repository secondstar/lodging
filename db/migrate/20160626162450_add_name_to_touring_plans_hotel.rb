class AddNameToTouringPlansHotel < ActiveRecord::Migration
  def change
    add_column :touring_plans_hotels, :name, :string
  end
end
