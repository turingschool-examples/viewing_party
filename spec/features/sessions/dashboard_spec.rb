require 'rails_helper'

RSpec.describe 'dashboard' do
  describe 'dashboard' do
    it 'as a registered user, I can log in with correct credentials' do
      user = User.create(username: 'person@ex.com', password: 'ilovecatsanddogs')

      visit root_path

      click_on "Log in here"

      expect(current_path).to eq("/login")

      fill_in :username, with: "person@ex.com"
      fill_in :password, with: "ilovecatsanddogs"

      click_on "Log in"

      expect(page).to have_content("Welcome, person@ex.com!")
      expect(page).to have_content("Friend List")
      expect(page).to have_button("Discover Movies")
    end

    it 'can add friends' do
      user = User.create(username: 'person@ex.com', password: 'ilovecatsanddogs')
      user_1 = User.create(username: 'person@ex1.com', password: 'ilovecatsanddogs2')
      user_2 = User.create(username: 'person@ex2.com', password: 'ilovecatsanddogs3')

      visit root_path

      click_on "Log in here"

      expect(current_path).to eq("/login")

      fill_in :username, with: "person@ex.com"
      fill_in :password, with: "ilovecatsanddogs"

      click_on "Log in"
      fill_in :search_by_username, with: 'person@ex1.com'
      click_on "Search"
      click_on "Add #{user_1.username}"

      within("#friends-list") do
        expect(page).to have_content(user_1.username)
      end
    end
  end
end