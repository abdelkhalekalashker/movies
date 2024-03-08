json.extract! review, :id, :stars, :movie_id, :user_id, :content, :created_at, :updated_at
json.url review_url(review, format: :json)
