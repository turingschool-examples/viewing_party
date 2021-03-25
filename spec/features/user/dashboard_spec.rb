require 'rails_helper'

RSpec.describe "Dashboard: Discover Movies" do
  describe "Discover movies button" do
    it "Redirects user to a discover page when button is clicked" do
      user = User.create(email: "joeb@email.com", password: "test")
      visit root_path

      click_link "Login"

      fill_in :email, with: user.email.upcase
      fill_in :password, with: user.password

      click_button 'Login'

      within(".topnav") do
        expect(page).to have_link("Discover Movies")

        click_link "Discover Movies"
      end

      expect(current_path).to eq(discover_path)
    end
  end
end
