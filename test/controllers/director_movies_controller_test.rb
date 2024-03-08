require "test_helper"

class DirectorMoviesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @director_movie = director_movies(:one)
  end

  test "should get index" do
    get director_movies_url
    assert_response :success
  end

  test "should get new" do
    get new_director_movie_url
    assert_response :success
  end

  test "should create director_movie" do
    assert_difference("DirectorMovie.count") do
      post director_movies_url, params: { director_movie: { director_id: @director_movie.director_id, movie_id: @director_movie.movie_id } }
    end

    assert_redirected_to director_movie_url(DirectorMovie.last)
  end

  test "should show director_movie" do
    get director_movie_url(@director_movie)
    assert_response :success
  end

  test "should get edit" do
    get edit_director_movie_url(@director_movie)
    assert_response :success
  end

  test "should update director_movie" do
    patch director_movie_url(@director_movie), params: { director_movie: { director_id: @director_movie.director_id, movie_id: @director_movie.movie_id } }
    assert_redirected_to director_movie_url(@director_movie)
  end

  test "should destroy director_movie" do
    assert_difference("DirectorMovie.count", -1) do
      delete director_movie_url(@director_movie)
    end

    assert_redirected_to director_movies_url
  end
end
