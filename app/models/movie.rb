class Movie < ApplicationRecord
  has_many :city_movies, dependent: :destroy
  has_many :director_movies, dependent: :destroy
  has_many :actor_movies, dependent: :destroy

  has_many :directors, through: :director_movies
  has_many :actors, through: :actor_movies
  has_many :cities, through: :city_movies

  has_many :country, through: :cities
end
