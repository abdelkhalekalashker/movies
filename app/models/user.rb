class User < ApplicationRecord
  has_many :movies_as_actor, through: :actor_movies, source: :movie

  has_many :director_movies, foreign_key: :director_id
  has_many :movies_as_director, through: :director_movies, source: :movie
end
