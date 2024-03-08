class ActorMovie < ApplicationRecord
  belongs_to :actor
  belongs_to :movie


  validates :movie_id, uniqueness: { scope: :actor_id }

end
