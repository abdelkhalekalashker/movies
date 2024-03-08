class CityMovie < ApplicationRecord
  belongs_to :city
  belongs_to :movie

  validates :movie_id, uniqueness: { scope: :city_id }

end
