require 'rails_helper'

RSpec.describe "Dashboard: Discover Movies" do
  describe "Discover movies button" do
    it "Redirects user to a discover page when button is clicked" do

      visit dashboard_path

      within(".topnav") do
        expect(page).to have_link("Discover Movies")

        click_link "Discover Movies"
      end

      expect(current_path).to eq(discover_path)
    end
  end
end
