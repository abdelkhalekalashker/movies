class AddUniqueConstraintToCountries < ActiveRecord::Migration[7.0]
  def change
    add_index :countries, :name, unique: true
  end
end
