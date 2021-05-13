# As an authenticated user,
# When I visit '/dashboard'
# I should see:
#
#  'Welcome <username>!' at the top of page
 #9 A button to Discover Movies
 #11 A viewing parties section
 #10 A friends section
require 'rails_helper'

RSpec.describe 'Dashboard', type: :feature do
  describe 'Dashboard Page' do
    it 'I can see welcome username at the top of the page' do
      user = User.create!(email: "ClaSte", password: "1234", password_confirmation: "1234" )
      visit root_path
      expect(page).to have_content("Welome! We're Glad You're Here! At Viewing Party, we make it easy to watch a movie with friends from the world. Let's get started!")
      expect(page).to have_link("New to Viewing Party? Register Here", href: new_user_path)
      fill_in :email, with: user.email
      fill_in :password, with: user.password
      expect(page).to have_button("Log In")
      click_on("Log In")
      expect(current_path).to eq("/dashboard")
      expect(page).to have_content("Welcome, #{user.email}!")
    end

    it "I can see and click a button to discover movies" do
      visit dashboard_path

      expect(page).to have_button("Discover Movies")

      click_button "Discover Movies"

      expect(current_path).to eq(discover_path)
    end

    it 'I can see a friends section' do
      visit dashboard_path

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Friends")
    end

    it 'I can see a viewing parties section' do
      visit dashboard_path

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Viewing Parties")
    end
  end
end
