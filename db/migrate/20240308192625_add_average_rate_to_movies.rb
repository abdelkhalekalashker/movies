class AddAverageRateToMovies < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :avarage_rate, :float
  end
end
