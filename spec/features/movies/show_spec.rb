require 'rails_helper'

RSpec.describe 'Movies details page', type: :feature do
  before :each do
    @host = create(:user, password: 'password')
    login(@host)
  end

  it 'shows all of the movies details', :vcr do
    visit movie_path(155)

    expect(page).to have_content('The Dark Knight')
    expect(page).to have_content('Vote Average: 8.5')
    expect(page).to have_content('Runtime: 2:32')
    expect(page).to have_content('Genre(s): Drama, Action, Crime, and Thriller')

    summary = "Batman raises the stakes in his war on crime. With the help of Lt. Jim Gordon and District Attorney Harvey Dent, Batman sets out to dismantle the remaining criminal organizations that plague the streets. The partnership proves to be effective, but they soon find themselves prey to a reign of chaos unleashed by a rising criminal mastermind known to the terrified citizens of Gotham as the Joker."

    expect(page).to have_content("Summary: #{summary}")

    cast = "Christian Bale - Bruce Wayne / Batman Heath Ledger - Joker Michael Caine - Alfred Pennyworth Gary Oldman - Commissioner James Gordon Aaron Eckhart - Harvey Dent / Two-Face Maggie Gyllenhaal - Rachel Dawes Morgan Freeman - Lucius Fox Nestor Carbonell - Mayor Anthony Garcia Monique Gabriela Curnen - Anna Ramirez Ron Dean - Michael Wuertz"

    expect(page).to have_content(cast)

    expect(page).to have_content("6 Reviews")

    within "#review-tricksy" do
      review_content = "Excellent movie. Best of the trilogy. Lovely music. Nolan is a genius. So is Heath Ledger."
      expect(page).to have_content('tricksy:')
      expect(page).to have_content(review_content)
    end
  end

  it 'has a button to create a viewing party with that movie', :vcr do
    visit movie_path(155)

    expect(page).to have_button("Create Viewing Party")
    click_on "Create Viewing Party"

    expect(current_path).to eq(new_party_path)
  end
end
