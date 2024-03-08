class CreateDirectorMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :director_movies do |t|
      t.references :director, foreign_key: { to_table: :users },null: false
      t.references :movie, foreign_key: { to_table: :users },null: false

      t.timestamps
    end
  end
end
