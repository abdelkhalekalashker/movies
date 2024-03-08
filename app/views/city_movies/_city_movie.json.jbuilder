json.extract! city_movie, :id, :city_id, :movie_id, :created_at, :updated_at
json.url city_movie_url(city_movie, format: :json)
