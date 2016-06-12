class AddThemeToHotel < ActiveRecord::Migration
  def change
    add_column :hotels, :theme, :string
  end
end
