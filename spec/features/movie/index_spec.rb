require "rails_helper"

describe "Movie index page", :vcr do
  describe "displays" do
    it "a button to discover top 40 movies and a button to search movies" do
      visit movies_path
      expect(page).to have_button("Find Popular Movies")
      expect(page).to have_button("Find Movies")
    end

    it "Find popular movies button links you to movie index and displays top movies" do
      visit movies_path

      click_button("Find Popular Movies")

      expect(current_path).to eq(movies_path)
      expect(page).to have_content("Wonder Woman 1984")
      expect(page).to have_content("Below Zero")
      expect(page).to have_content("The Little Things")
      expect(page).to have_content("Outside the Wire")
      expect(page).to have_content("Vanguard")
      expect(page).to have_content("Breach")
      expect(page).to have_content("Soul")
      expect(page).to have_content("Skylines")
      expect(page).to have_content("Black Water: Abyss")
      expect(page).to have_content("Finding 'Ohana")
    end

    it "Has a button to search for movie by title then returns the results even after searching for movies already" do
      visit movies_path
      click_button("Find Popular Movies")

      expect(current_path).to eq(movies_path)
      fill_in :query, with: "wonder woman"
      click_button("Find Movies")

      expect(current_path).to eq(movies_path)

      expect(page).to have_content("Wonder Woman 1984")
      expect(page).to have_content("Wonder Woman")
      expect(page).to have_content("Wonder Woman")
      expect(page).to have_content("Wonder Woman: Bloodlines")
      expect(page).to have_content("Wonder Woman 3")
      expect(page).to have_content("Wonder Woman")
      expect(page).to have_content("Wonder Woman")
      expect(page).to have_content("Technology/Transformation: Wonder Woman")
      expect(page).to have_content("Wonder Woman: Grace & Power")
      expect(page).to have_content("Wonder Woman: Who's Afraid of Diana Prince?")
      expect(page).to have_content("Professor Marston and the Wonder Women")
    end
  end
end
