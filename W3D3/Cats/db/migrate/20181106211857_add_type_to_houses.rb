class AddTypeToHouses < ActiveRecord::Migration[5.2]
  def change
  	add_column :houses, :house_type, :string
  	remove_column :houses, :type
  end
end
