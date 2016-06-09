class CreateTouringPlansHotels < ActiveRecord::Migration
  def change
    create_table :touring_plans_hotels do |t|

      t.timestamps null: false
    end
  end
end
