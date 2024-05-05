class AddUniqueIndexToCities < ActiveRecord::Migration[7.0]
  def change
    add_index :cities, [:name, :country_id], unique: true
  end
end
