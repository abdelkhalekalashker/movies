class RemoveColumnsFromMovies < ActiveRecord::Migration[7.0]
  def change
    remove_column :movies, :country
    remove_column :movies, :director
    remove_column :movies, :actor
    remove_column :movies, :filming_location
  end
end
