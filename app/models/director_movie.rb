# app/models/director_movie.rb
class DirectorMovie < ApplicationRecord
  belongs_to :director, class_name: 'User'
  belongs_to :movie

  validates :movie_id, uniqueness: { scope: :director_id }
end
