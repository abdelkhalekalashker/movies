class ActorMoviesController < ApplicationController
  before_action :set_actor_movie, only: %i[ show edit update destroy ]

  # GET /actor_movies or /actor_movies.json
  def index
    @actor_movies = ActorMovie.all
  end

  # GET /actor_movies/1 or /actor_movies/1.json
  def show
  end

  # GET /actor_movies/new
  def new
    @actor_movie = ActorMovie.new
  end

  # GET /actor_movies/1/edit
  def edit
  end

  # POST /actor_movies or /actor_movies.json
  def create
    @actor_movie = ActorMovie.new(actor_movie_params)

    respond_to do |format|
      if @actor_movie.save
        format.html { redirect_to actor_movie_url(@actor_movie), notice: "Actor movie was successfully created." }
        format.json { render :show, status: :created, location: @actor_movie }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @actor_movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /actor_movies/1 or /actor_movies/1.json
  def update
    respond_to do |format|
      if @actor_movie.update(actor_movie_params)
        format.html { redirect_to actor_movie_url(@actor_movie), notice: "Actor movie was successfully updated." }
        format.json { render :show, status: :ok, location: @actor_movie }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @actor_movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /actor_movies/1 or /actor_movies/1.json
  def destroy
    @actor_movie.destroy

    respond_to do |format|
      format.html { redirect_to actor_movies_url, notice: "Actor movie was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_actor_movie
      @actor_movie = ActorMovie.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def actor_movie_params
      params.require(:actor_movie).permit(:actor_id, :movie_id)
    end
end
