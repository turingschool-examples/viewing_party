require 'rails_helper'

RSpec.describe "As an Authorized User" do
  describe "when I visit a movie details page" do
    it "welcomes me with my username" do
      VCR.use_cassette('movie_info') do
        visit movie_path(550)

        #expect(page).to have_content("Welcome #{@user.email}")
      end
    end

    it "displays the title of the movie, the vote average, the runtime, summary and genres" do
      VCR.use_cassette('movie_info') do
        visit movie_path(550)

        expect(page).to have_content("Fight Club")
        expect(page).to have_content("Vote Average: 8.4")
        expect(page).to have_content("Runtime: 139 minutes")
        expect(page).to have_content("Genre(s): Drama")
      end
    end

    it "displays the cast" do
      VCR.use_cassette('movie_info') do
        visit movie_path(550)

        expect(page).to have_content("Edward Norton / The Narrator")
        expect(page).to have_content("Brad Pitt / Tyler Durden")
        expect(page).to have_content("Helena Bonham Carter / Marla Singer")
        expect(page).to have_content("David Andrews / Thomas")
        expect(page).to_not have_content("Christina Cabot / Group Leader")
      end
    end

    it "displays the reviews" do
      VCR.use_cassette('movie_info') do
        visit movie_path(550)

        expect(page).to have_content("Goddard")
        expect(page).to have_content("r96sk")
      end
    end
  end
end
