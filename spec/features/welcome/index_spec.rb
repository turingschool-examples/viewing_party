require 'rails_helper'

RSpec.describe 'welcome index page' do
  describe 'when I visit the welcome page' do
    it 'has a welcome message' do
      visit root_path

      expect(page).to have_content("Welcome to Viewing Party")
    end

    it 'has a brief description of the application' do
      visit root_path

      expect(page).to have_content("Search for Movie by Title or Movie ID")
    end

    it 'has a button to log in' do
      visit root_path

      expect(page).to have_link('Sign In')

      click_link 'Sign In'

      expect(current_path).to eq(login_path)
    end

    it 'has a link to register' do
      visit root_path

      expect(page).to have_link('Sign Up')

      click_link 'Sign Up'

      expect(current_path).to eq(new_user_path)
    end
  end
end
