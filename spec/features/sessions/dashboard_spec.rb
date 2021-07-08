require 'rails_helper'

describe 'dashboard' do
  it 'as a registered user, I can log in with correct credentials' do
      user = User.create(username: 'person@ex.com', password: 'ilovecatsanddogs')

        visit root_path

        click_on "Log in here"

        expect(current_path).to eq("/login")

        fill_in :username, with: "person@ex.com"
        fill_in :password, with: "ilovecatsanddogs"

        click_on "Log in"


      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Welcome, person@ex.com!")
      expect(page).to have_content("Friend List")
      expect(page).to have_button("Discover Movies")
  end
end