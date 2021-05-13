require 'rails_helper'

RSpec.describe 'User Can Log In' do
  describe 'User is taken to login form to enter credentials' do
    it 'as a registered user, I can log in with correct credentials' do
      user = User.create(email: 'some@example.com', password: 'mystrongpassword')
      visit root_path
      click_link 'Log In'
      expect(current_path).to eq(login_path)

      fill_in :email, with: user.email
      fill_in :password, with: 'mystrongpassword'
      click_button 'Log In'

      expect(current_path).to eq(root_path)
      expect(page).to have_content("Welcome #{user.email}!")
      expect(page).to_not have_link("Log In")
      expect(page).to_not have_link("Register As A User")
      expect(page).to have_link("Log Out")
    end
  end

  describe 'User is taken to login form to enter credentials' do
    it 'user enters invalid credentials' do
      user = User.create(email: 'some@example.com', password: 'mystrongpassword')
      visit root_path
      click_link 'Log In'
      expect(current_path).to eq(login_path)

      fill_in :email, with: user.email
      fill_in :password, with: 'mystrongpassworddoesnotwork'
      click_button 'Log In'

      expect(current_path).to eq(login_path)
      expect(page).to have_content("Your email or password are incorrect")
    end
  end

  describe 'User is succesfully logged in' do
    it 'allows a user to log out' do
      user = User.create(email: 'some@example.com', password: 'mystrongpassword')
      visit root_path
      click_link 'Log In'
      expect(current_path).to eq(login_path)

      fill_in :email, with: user.email
      fill_in :password, with: 'mystrongpassword'
      click_button 'Log In'

      expect(current_path).to eq(root_path)
      expect(page).to have_link('Log Out')
      click_link 'Log Out'

      expect(current_path).to eq(root_path)
      expect(page).to have_content('You have been logged out')
    end
  end
end
