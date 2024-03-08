# app/models/actor_movie.rb
class ActorMovie < ApplicationRecord
  belongs_to :actor, class_name: 'Actor'
  belongs_to :movie

  validates :movie_id, uniqueness: { scope: :actor_id }

end
