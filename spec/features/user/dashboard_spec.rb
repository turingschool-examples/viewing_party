require 'rails_helper'

RSpec.describe "Dashboard: Discover Movies" do
  describe "Discover movies button" do
    it "Redirects user to a discover page when button is clicked" do
      user = User.create(email: "funbucket13@example.com", password: "test")

      visit root_path
      click_link "Login"
      expect(current_path).to eq(login_path)
      fill_in :email, with: "funbucket13@example.com"
      fill_in :password, with: "test"
      click_button "Login"


      within(".topnav") do
        expect(page).to have_link("Discover Movies")

        click_link "Discover Movies"
      end

      expect(current_path).to eq(discover_path)
    end
  end
end
