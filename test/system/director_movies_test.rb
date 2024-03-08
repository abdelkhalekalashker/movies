require "application_system_test_case"

class DirectorMoviesTest < ApplicationSystemTestCase
  setup do
    @director_movie = director_movies(:one)
  end

  test "visiting the index" do
    visit director_movies_url
    assert_selector "h1", text: "Director movies"
  end

  test "should create director movie" do
    visit director_movies_url
    click_on "New director movie"

    fill_in "Director", with: @director_movie.director_id
    fill_in "Movie", with: @director_movie.movie_id
    click_on "Create Director movie"

    assert_text "Director movie was successfully created"
    click_on "Back"
  end

  test "should update Director movie" do
    visit director_movie_url(@director_movie)
    click_on "Edit this director movie", match: :first

    fill_in "Director", with: @director_movie.director_id
    fill_in "Movie", with: @director_movie.movie_id
    click_on "Update Director movie"

    assert_text "Director movie was successfully updated"
    click_on "Back"
  end

  test "should destroy Director movie" do
    visit director_movie_url(@director_movie)
    click_on "Destroy this director movie", match: :first

    assert_text "Director movie was successfully destroyed"
  end
end
