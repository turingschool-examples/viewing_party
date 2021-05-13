require 'rails_helper'

RSpec.describe 'Login page' do
  before :each do
    visit '/login'
    email = "example@example.com"
    password = "test"
    @user = User.create!(email: email, password: password)
  end

  describe 'when I visit the login page' do
    it 'I enter correct email and password' do
      fill_in :email, with: @user.email
      fill_in :password, with: @user.password
      click_button "Log In"

      expect(current_path).to eq('/dashboard')
    end
  end

  describe 'sad path and edge case' do
    it 'can see message for blank fields and incorrect password' do
      bad_password = "world100"
      fill_in :email, with: @user.email
      fill_in :password, with: bad_password
      click_button "Log In"

      expect(current_path).to eq('/login')
      expect(page).to have_content('Your credentials are incorrect')

      visit '/login'

      fill_in :email, with: ''
      fill_in :password, with: ''
      click_button "Log In"

      expect(current_path).to eq('/login')
      expect(page).to have_content('Fields cannot be blank')
    end

    it 'can see message for incorrect email' do
      bad_email = "helloworld@email.com"
      fill_in :email, with: bad_email
      fill_in :password, with: @user.password
      click_button "Log In"

      expect(current_path).to eq('/login')
      expect(page).to have_content('User does not exist with that email')
    end
  end
end
