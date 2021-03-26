require 'rails_helper'

RSpec.describe "As a user after I click the link from my dashboard to visit the Discover page" do
  describe "takes me to the landing page" do
    it "should display a search form to search by movie title (returning 40 results)" do
      user_1 = User.create!({email:'am@email.com', password: 'password123'})
      visit discover_path

      expect(current_path).to eq(discover_path)
      # expect(page).to have_content("Welcome #{user_1.email}!")
      expect(page).to have_button("Find Top Rated Movies")
      expect(page).to have_button("Find Movies")
    end
  end

  describe "search for top 40 rated movies" do
    it "should return the top 40 movie titles based on Vote Average" do
      VCR.use_cassette('top_forty_movies') do
        visit(discover_path)
        click_button("Find Top Rated Movies")

        expect(page).to have_content("Gabriel's Inferno Part II")
        expect(page).to have_content("Vote Average: 8.8")
        expect(page).to_not have_content("Vote Average: 1.5")
        expect(page).to have_content("David Attenborough: A Life on Our Planet")
        expect(page).to have_content("Mortal Kombat Legends")
      end
    end
  end

  describe "search for a movie by title" do
    it "should return movies that match the user query and thier rating" do
      VCR.use_cassette('movie_search') do
        visit(discover_path)
        fill_in :movie_query, with: "phoenix"
        click_on("Find Movies")

        expect(page).to have_content("Dark Phoenix")
        expect(page).to have_content("Vote Average: 6.1")
        expect(page).to have_content("Harry Potter and the Order of the Phoenix")
        expect(page).to have_content("Rising Phoenix")
        expect(page).to have_content("Griffin & Phoenix")
        expect(page).to have_content("Phoenix Forgotten")
      end
    end
  end
end
