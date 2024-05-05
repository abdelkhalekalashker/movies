class AddUniqueConstraintToDirectorMovie < ActiveRecord::Migration[7.0]
  def change
    add_index :director_movies, [:movie_id, :director_id], unique: true
  end
end
