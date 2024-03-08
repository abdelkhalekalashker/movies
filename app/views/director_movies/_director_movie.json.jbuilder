json.extract! director_movie, :id, :director_id, :movie_id, :created_at, :updated_at
json.url director_movie_url(director_movie, format: :json)
