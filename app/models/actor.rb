class Actor < User
  has_many :actor_movies

  has_many :actor_movies, foreign_key: :actor_id

  has_many :movies, through: :actor_movies
end
