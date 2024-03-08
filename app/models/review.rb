class Review < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  after_create :update_movie_average_rate

  def update_movie_average_rate
    movie = Movie.find(movie_id)
    # this can be created using counter cache
    reviews_stars = Review.where(movie_id: movie).pluck(:stars)
    movie.update(average_rate: reviews_stars.sum / reviews_stars.size)
  end
end
