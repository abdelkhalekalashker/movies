class AddAverageRateToMovies < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :average_rate, :float, default: 0.0
  end
end
