class CreateCityMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :city_movies do |t|
      t.references :city, null: false, foreign_key: true
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
