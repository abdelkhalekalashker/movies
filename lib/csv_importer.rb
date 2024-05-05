require 'csv'

class CsvImporter
  def self.movie_import(file)

    countries = []
    cities = []
    movies = []
    actor_movies = []
    city_movies = []
    director_movies = []

    CSV.foreach(file.path, headers: true) do |row|
      country = Country.find_or_initialize_by(name: row["Country"])
      countries << country
      city = City.find_or_initialize_by(name: row["Filming location"], country_id: country.id)
      cities << city

      director = Director.find_or_create_by(name: row["Director"])
      actor = Actor.find_or_create_by(name: row["Actor"])

      movie = Movie.find_or_initialize_by(movie: row["Movie"], year: row["Year"].to_i, description: row["Description"])
      movies << movie

      if movie
        city_movie = CityMovie.find_or_initialize_by(movie_id: movie.id, city_id: city.id)
        city_movies << city_movie if movie && city
        actor_movie = ActorMovie.find_or_initialize_by(actor_id: actor.id, movie_id: movie.id)
        actor_movies << actor_movie if movie && actor
        director_movie = DirectorMovie.find_or_initialize_by(director_id: director.id, movie_id: movie.id)
        director_movies << director_movie if movie && director
      end
    end

    begin
      Country.import(countries, on_duplicate_key_ignore: { conflict_target: [:name] })
      City.import(cities, on_duplicate_key_ignore: { conflict_target: [:name, :country_id] })
      Movie.import(movies, on_duplicate_key_ignore: { conflict_target: [:movie] })
      ActorMovie.import(actor_movies, on_duplicate_key_ignore: { conflict_target: [:movie_id, :actor_id] })
      CityMovie.import(city_movies, on_duplicate_key_ignore: { conflict_target: [:city_id, :movie_id] })
      DirectorMovie.import(director_movies, on_duplicate_key_ignore: { conflict_target: [:director_id, :movie_id] })
    rescue => e
      "Unable to import some movies from file: #{e.message}"
    end
  end

  def self.review_importer(file)
    reviews_data = []

    CSV.foreach(file.path, headers: true) do |row|
      user = User.find_or_create_by(name: row["User"])

      movie = Movie.find_or_create_by(movie: row["Movie"])
      review_data = {stars: row["Stars"], content: row["Review"], movie_id: movie.id, user_id: user.id}
      reviews_data << review_data
    end

    begin
      Review.import(reviews_data, on_duplicate_key_ignore: true)
    rescue => e
      "Error importing reviews: #{e.message}"
    end

  end


end
