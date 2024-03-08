class CityMoviesController < ApplicationController
  before_action :set_city_movie, only: %i[ show edit update destroy ]

  # GET /city_movies or /city_movies.json
  def index
    @city_movies = CityMovie.all
  end

  # GET /city_movies/1 or /city_movies/1.json
  def show
  end

  # GET /city_movies/new
  def new
    @city_movie = CityMovie.new
  end

  # GET /city_movies/1/edit
  def edit
  end

  # POST /city_movies or /city_movies.json
  def create
    @city_movie = CityMovie.new(city_movie_params)

    respond_to do |format|
      if @city_movie.save
        format.html { redirect_to city_movie_url(@city_movie), notice: "City movie was successfully created." }
        format.json { render :show, status: :created, location: @city_movie }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @city_movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /city_movies/1 or /city_movies/1.json
  def update
    respond_to do |format|
      if @city_movie.update(city_movie_params)
        format.html { redirect_to city_movie_url(@city_movie), notice: "City movie was successfully updated." }
        format.json { render :show, status: :ok, location: @city_movie }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @city_movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /city_movies/1 or /city_movies/1.json
  def destroy
    @city_movie.destroy

    respond_to do |format|
      format.html { redirect_to city_movies_url, notice: "City movie was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_city_movie
      @city_movie = CityMovie.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def city_movie_params
      params.require(:city_movie).permit(:city_id, :movie_id)
    end
end
