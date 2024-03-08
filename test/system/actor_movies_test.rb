require "application_system_test_case"

class ActorMoviesTest < ApplicationSystemTestCase
  setup do
    @actor_movie = actor_movies(:one)
  end

  test "visiting the index" do
    visit actor_movies_url
    assert_selector "h1", text: "Actor movies"
  end

  test "should create actor movie" do
    visit actor_movies_url
    click_on "New actor movie"

    fill_in "Actor", with: @actor_movie.actor_id
    fill_in "Movie", with: @actor_movie.movie_id
    click_on "Create Actor movie"

    assert_text "Actor movie was successfully created"
    click_on "Back"
  end

  test "should update Actor movie" do
    visit actor_movie_url(@actor_movie)
    click_on "Edit this actor movie", match: :first

    fill_in "Actor", with: @actor_movie.actor_id
    fill_in "Movie", with: @actor_movie.movie_id
    click_on "Update Actor movie"

    assert_text "Actor movie was successfully updated"
    click_on "Back"
  end

  test "should destroy Actor movie" do
    visit actor_movie_url(@actor_movie)
    click_on "Destroy this actor movie", match: :first

    assert_text "Actor movie was successfully destroyed"
  end
end
