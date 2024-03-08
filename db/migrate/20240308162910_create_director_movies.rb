class CreateDirectorMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :director_movies do |t|
      t.references :director, null: false, foreign_key: true
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
