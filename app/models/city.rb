class City < ApplicationRecord
  belongs_to :country
  has_many :city_movies
  has_many :cities, through: :city_movies
end
