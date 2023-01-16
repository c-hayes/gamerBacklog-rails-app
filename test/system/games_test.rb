require "application_system_test_case"

class GamesTest < ApplicationSystemTestCase
  setup do
    @game = games(:one)
  end

  test "visiting the index" do
    visit games_url
    assert_selector "h1", text: "Games"
  end

  test "should create game" do
    visit games_url
    click_on "New game"

    fill_in "Artworks", with: @game.artworks
    fill_in "Genre", with: @game.genre
    fill_in "Name", with: @game.name
    fill_in "Platforms", with: @game.platforms
    fill_in "Release dates", with: @game.release_dates
    fill_in "Screenshots", with: @game.screenshots
    fill_in "Summary", with: @game.summary
    fill_in "Total rating", with: @game.total_rating
    click_on "Create Game"

    assert_text "Game was successfully created"
    click_on "Back"
  end

  test "should update Game" do
    visit game_url(@game)
    click_on "Edit this game", match: :first

    fill_in "Artworks", with: @game.artworks
    fill_in "Genre", with: @game.genre
    fill_in "Name", with: @game.name
    fill_in "Platforms", with: @game.platforms
    fill_in "Release dates", with: @game.release_dates
    fill_in "Screenshots", with: @game.screenshots
    fill_in "Summary", with: @game.summary
    fill_in "Total rating", with: @game.total_rating
    click_on "Update Game"

    assert_text "Game was successfully updated"
    click_on "Back"
  end

  test "should destroy Game" do
    visit game_url(@game)
    click_on "Destroy this game", match: :first

    assert_text "Game was successfully destroyed"
  end
end
