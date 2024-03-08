require "test_helper"

class CityMoviesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @city_movie = city_movies(:one)
  end

  test "should get index" do
    get city_movies_url
    assert_response :success
  end

  test "should get new" do
    get new_city_movie_url
    assert_response :success
  end

  test "should create city_movie" do
    assert_difference("CityMovie.count") do
      post city_movies_url, params: { city_movie: { city_id: @city_movie.city_id, movie_id: @city_movie.movie_id } }
    end

    assert_redirected_to city_movie_url(CityMovie.last)
  end

  test "should show city_movie" do
    get city_movie_url(@city_movie)
    assert_response :success
  end

  test "should get edit" do
    get edit_city_movie_url(@city_movie)
    assert_response :success
  end

  test "should update city_movie" do
    patch city_movie_url(@city_movie), params: { city_movie: { city_id: @city_movie.city_id, movie_id: @city_movie.movie_id } }
    assert_redirected_to city_movie_url(@city_movie)
  end

  test "should destroy city_movie" do
    assert_difference("CityMovie.count", -1) do
      delete city_movie_url(@city_movie)
    end

    assert_redirected_to city_movies_url
  end
end
