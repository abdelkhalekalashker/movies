class DirectorMoviesController < ApplicationController
  before_action :set_director_movie, only: %i[ show edit update destroy ]

  # GET /director_movies or /director_movies.json
  def index
    @director_movies = DirectorMovie.all
  end

  # GET /director_movies/1 or /director_movies/1.json
  def show
  end

  # GET /director_movies/new
  def new
    @director_movie = DirectorMovie.new
  end

  # GET /director_movies/1/edit
  def edit
  end

  # POST /director_movies or /director_movies.json
  def create
    @director_movie = DirectorMovie.new(director_movie_params)

    respond_to do |format|
      if @director_movie.save
        format.html { redirect_to director_movie_url(@director_movie), notice: "Director movie was successfully created." }
        format.json { render :show, status: :created, location: @director_movie }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @director_movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /director_movies/1 or /director_movies/1.json
  def update
    respond_to do |format|
      if @director_movie.update(director_movie_params)
        format.html { redirect_to director_movie_url(@director_movie), notice: "Director movie was successfully updated." }
        format.json { render :show, status: :ok, location: @director_movie }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @director_movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /director_movies/1 or /director_movies/1.json
  def destroy
    @director_movie.destroy

    respond_to do |format|
      format.html { redirect_to director_movies_url, notice: "Director movie was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_director_movie
      @director_movie = DirectorMovie.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def director_movie_params
      params.require(:director_movie).permit(:director_id, :movie_id)
    end
end
