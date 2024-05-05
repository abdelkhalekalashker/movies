class AddUniqueConstraintToMovies < ActiveRecord::Migration[7.0]
  def change
    add_index :movies, :movie, unique: true
  end
end
