class AddUniqueConstraintToCityMovies < ActiveRecord::Migration[7.0]
  def change
    add_index :city_movies, [:movie_id, :city_id], unique: true
  end
end
