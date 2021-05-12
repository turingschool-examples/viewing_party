require 'rails_helper'

RSpec.describe 'Dashboard page' do
  describe 'when a logged in user visits the dashboard index path' do
    it 'displays a welcome message, button to discover movies, friends section and viewing parties section' do
      user = User.create(user_name: 'joeyh@test.com', password: 'doyouwanttohearasong')
      visit root_path
      click_button "Log in"
      expect(current_path).to eq(login_path)
        
      fill_in :user_name, with: "joeyh@test.com"
      fill_in :password, with: "doyouwanttohearasong"
      click_button "Log in"
      
      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Welcome joeyh@test.com!")
      expect(page).to have_button("Discover Movies")
      expect(page).to have_content("Friends List")
      expect(page).to have_content("Viewing Parties List")
    end
  end
end