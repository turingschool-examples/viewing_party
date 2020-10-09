require 'rails_helper'

RSpec.describe 'Welcome Page' do
  describe 'shows welcome message' do
    it 'and description of app' do
      visit '/'

      expect(page).to have_content("Welcome to Viewing Party!")
      expect(page).to have_content("Welcome to Viewing Party! This app allows ....")
    end

    it 'and button to log in and can log in with valid credentials' do
      user = create :user
      visit '/'

      expect(page).to have_content('Email')
      expect(page).to have_content('Password')
      expect(page).to have_button("Log in")

      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password

      click_button 'Log in'

      expect(current_path).to eq('/dashboard')
    end
    it 'and can not log in with bad credentials' do
      user = create :user
      visit '/'

      expect(page).to have_content('Email')
      expect(page).to have_content('Password')
      expect(page).to have_button("Log in")

      fill_in 'Email', with: user.email
      fill_in 'Password', with: 'not a password'

      click_button 'Log in'

      expect(current_path).to eq('/')
      expect(page).to have_content('That email/password combination does not exist in our records')

    end
    it 'and link to register' do
      visit '/'

      expect(page).to have_link("New to Viewing Party? Register Here")

      click_link 'New to Viewing Party? Register Here'

      expect(current_path).to eq('/register')
    end
  end
end
