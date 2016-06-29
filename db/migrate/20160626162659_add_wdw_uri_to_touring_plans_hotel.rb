class AddWdwUriToTouringPlansHotel < ActiveRecord::Migration
  def change
    add_column :touring_plans_hotels, :wdw_uri, :string
  end
end
