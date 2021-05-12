require 'rails_helper'

RSpec.describe 'movies discover page page' do

  describe 'when a logged in user visits the dashboard index path' do
    it 'displays a welcome message, button to discover movies, friends section and viewing parties section' do
      user = User.create(user_name: 'joeyh@test.com', password: 'doyouwanttohearasong')
      visit login_path
      fill_in :user_name, with: "joeyh@test.com"
      fill_in :password, with: "doyouwanttohearasong"
      click_button "Log in"
      click_button "Discover Movies"

      expect(current_path).to eq("/discover")
      expect(page).to have_content("Discover Movies")
      expect(page).to have_button("Discover Top 40 Movies")
      expect(page).to have_content("Search For Movies")
      expect(page).to have_field(:search)

    end
  end
end