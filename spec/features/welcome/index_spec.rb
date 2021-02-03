require 'rails_helper'

RSpec.describe 'welcome index page' do
  describe 'when I visit the welcome page' do
    it 'has a welcome message' do
      visit root_path

      expect(page).to have_content("Welcome to the Viewing Party! Sign in or register!")
    end

    it 'has a brief description of the application' do
      visit root_path

      expect(page).to have_content("Find info about gnarly movies and create your own viewing parties!")
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
