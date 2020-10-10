require 'rails_helper'

describe 'As an authenticated user' do
  describe "When I visit the discover page " do
    before :each do
      visit '/discover'
    end

    it "I see a button to discover top 40 movies" do

      expect(page).to have_button('Discover Top 40')
    end

    it "I see a search field with button to search movies by title" do
      expect(page).to have_field('keywords')
      expect(page).to have_button('Search By Movie Title')
    end
  end
end

feature 'Results for top 40 movies' do
  scenario "User clicks the top 40 button", :vcr do
      visit '/discover'

      click_button('Discover Top 40')
      expect(current_path).to eq('/movies')
      expect(page).to have_content("The Green Mile")
      expect(page).to have_content("Vote Average: 8.5")
      expect(page).to have_content("Pulp Fiction")
      expect(page).to have_content("Vote Average: 8.5")
  end
end
