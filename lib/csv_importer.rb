require 'csv'

class CsvImporter
  def self.movie_import(file)
    CSV.foreach(file.path, headers: true) do |row|
      country = Country.find_or_create_by(name: row["Country"])
      city = City.find_or_create_by(name: row["Filming location"], country_id: country.id)

      director = Director.find_or_create_by(name: row["Director"])


      actor = Actor.find_or_create_by(name: row["Actor"])


      movie = Movie.find_or_create_by(movie: row["Movie"], year: row["Year"].to_i, description: row["Description"])

      city_movie = CityMovie.find_or_create_by(movie_id: movie.id, city_id: city.id)

      actor_movie = ActorMovie.find_or_create_by(actor_id: actor.id, movie_id: movie.id)

      director_movie = DirectorMovie.find_or_create_by(director_id: director.id, movie_id: movie.id)

    end
  end

  def self.review_importer(file)
    CSV.foreach(file.path, headers: true) do |row|

      user = User.find_or_create_by(name: row["User"])

      movie = Movie.find_or_create_by(movie: row["Movie"])
      review = Review.create(stars: row["Stars"], content: row["Review"], movie: movie, user: user)
    end
  end


end
