require 'rails_helper'

RSpec.describe 'Welcome Page' do
  describe 'shows welcome message' do
    it 'and description of app' do
      visit '/'

      expect(page).to have_content("Welcome to Viewing Party!")
      expect(page).to have_content("Welcome to Viewing Party! This app allows ....")
    end

    it 'and button to log in' do
      visit '/'

      expect(page).to have_content('Email:')
      expect(page).to have_content('Password:')
      expect(page).to have_button("Login")

      fill_in :email, with: 'email'
      fill_in :password, with: 'password'

      click_button 'Login'
    end
    it 'and link to register' do
      visit '/'

      expect(page).to have_link("New to Viewing Party? Register Here")

      click_link 'New to Viewing Party? Register Here'

      expect(page).to have_content('Form to register')
    end
  end
end
