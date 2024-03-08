require 'csv'

class CsvImporter
  def self.movie_import(file)
    CSV.foreach(file.path, headers: true) do |row|
      country = Country.find_or_create_by(name: row["Country"])
      city = City.find_or_create_by(name: row["Filming location"], country_id: country.id)

      director = Director.find_by(name: row["Director"])
      director = Director.create(name: row["Director"], password: "Top secret") if director.nil?

      actor = Actor.find_by(name: row["Actor"])

      actor = Actor.create(name: row["Actor"],  password: "Top secret") if actor.nil?


      movie = Movie.find_or_create_by(movie: row["Movie"], year: row["Year"].to_i, description: row["Description"])

      city_movie = CityMovie.find_or_create_by(movie_id: movie.id, city_id: city.id)

      actor_movie = ActorMovie.find_or_create_by(actor_id: actor.id, movie_id: movie.id)

      director_movie = DirectorMovie.find_or_create_by(director_id: director.id, movie_id: movie.id)

    end
  end

  def self.review_importer(file)
    CSV.foreach(file.path, headers: true) do |row|
      user = User.find_by(name: row["User"])
      user = User.create(name: row["User"],  password: "Top secret") if user.nil?
      movie = Movie.find_by(movie: row["Movie"])
      Review.create(stars: row["Stars"], content: row["Review"], movie: movie, user: user)
    end
  end


end
