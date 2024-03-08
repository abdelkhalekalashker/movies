require 'csv'

class CsvImporter
  def self.movie_import(file)
    CSV.foreach(file.path, headers: true) do |row|
      country = Country.find_or_create_by(name: row[:country])

      city = City.find_or_create_by(name: row[:city], country_id: country&.id)

      director = Director.find_or_create_by(name: row[:director])

      actor = Actor.find_or_create_by(name: row[:actor])

      movie = Movie.find_or_create_by(movie: row[:Movie], year: row[:Year], description: row[:Description])

      city_movie = CityMovie.find_or_create_by(movie_id: movie.id, city: city.id)

      actor_movie = ActorMovie.find_or_create_by(actor_id: actor.id, movie_id: movie.id)

      director_movie = DirectorMovie.find_or_create_by(director_id: director.id, movie_id: movie.id)

    end
  end

  def self.review_importer
    CSV.foreach(file.path, headers: true) do |row|
      user = User.find_by(name: row["User"])
      movie = Movie.find_by(name: row["Movie"])
      Review.create(stars: row["Stars"], content: row["Review"], movie: movie, user: user)
    end
  end


end
