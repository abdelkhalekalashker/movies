require "application_system_test_case"

class CityMoviesTest < ApplicationSystemTestCase
  setup do
    @city_movie = city_movies(:one)
  end

  test "visiting the index" do
    visit city_movies_url
    assert_selector "h1", text: "City movies"
  end

  test "should create city movie" do
    visit city_movies_url
    click_on "New city movie"

    fill_in "City", with: @city_movie.city_id
    fill_in "Movie", with: @city_movie.movie_id
    click_on "Create City movie"

    assert_text "City movie was successfully created"
    click_on "Back"
  end

  test "should update City movie" do
    visit city_movie_url(@city_movie)
    click_on "Edit this city movie", match: :first

    fill_in "City", with: @city_movie.city_id
    fill_in "Movie", with: @city_movie.movie_id
    click_on "Update City movie"

    assert_text "City movie was successfully updated"
    click_on "Back"
  end

  test "should destroy City movie" do
    visit city_movie_url(@city_movie)
    click_on "Destroy this city movie", match: :first

    assert_text "City movie was successfully destroyed"
  end
end
