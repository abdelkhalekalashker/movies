class ChangeYearType < ActiveRecord::Migration[7.0]
  def change
    remove_column :movies, :year
    add_column :movies, :year, :integer
  end
end
