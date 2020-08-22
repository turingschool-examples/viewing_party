require "rails_helper"

RSpec.describe 'As an authenticated user' do
  before(:each) do
    stub_omniauth
    visit root_path
    expect(page).to have_link("Sign in with Google")
    click_link "Sign in with Google"
  end

  describe "On my dashboard" do
    it "when I click the 'Discover Movies' button I am taken to a discover page" do

      expect(current_path).to eq("/dashboard")

      click_button("Discover Movies")

      expect(current_path).to eq("/discover")
    end
  end

  describe "On the discover page" do
    it "should have a button to discover top movies and a search bar" do
      visit "/discover"
      save_and_open_page
      expect(page).to have_button("Find Top Rated Movies")
      expect(page).to have_field('Search by movie title')
      expect(page).to have_button("Find Movies")
    end
  end
end
