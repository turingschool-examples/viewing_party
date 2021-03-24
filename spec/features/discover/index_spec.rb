require 'rails_helper'

RSpec.describe "As a user after I click the link from my dashboard to visit the Discover page" do
  describe "takes me to the landing page" do
    it "should display a search form to search by movie title (returning 40 results)" do
      user_1 = User.create({email:'am@email.com', password: 'password123'})
      visit dashboard_path(user_1)
      click_link "Discover Movies"

      expect(current_path).to eq(discover_path)
      expect(page).to have_content("Search by movie title")
      expect(page).to have_button("Find Movies")

    end
    it "should display a button to 'Find Top Rated Movies'" do
      visit(discover_path)

      expect(page).to have_button("Find Top Rated Movies")
    end
  end

  describe "search for top 40 rated movies" do
    it "should return the top 40 movie titles based on Vote Average" do
      visit(discover_path)
      click_button("Find Top Rated Movies")

      expect(page).to have_content()
    end
  end

  describe "search for a movie by title" do
    it "should return movies that match the user query" do
      visit(discover_path)
      fill_in :movie_search, with: "phoenix"
      click_on("Find Movies")

      expect(page).to have_content("Dark Phoenix")
      expect(page).to have_content("Harry Potter and the Order of the Phoenix")
      expect(page).to have_content("Rising Phoenix")
      expect(page).to have_content("Griffin & Phoenix")
      expect(page).to have_content("Phoenix Forgotten")
    end
  end
end
