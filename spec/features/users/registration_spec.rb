require 'rails_helper'

RSpec.describe 'Registration Page' do
  before :each do

    visit "/registration"
  end

  describe 'User visits the registration page' do
    it 'can see a form to register' do
      expect(current_path).to eq('/registration')

      email = "example@example.com"
      password = "test"
      fill_in "user[email]", with: email
      fill_in "user[password]", with: password
      fill_in "user[password_confirmation]", with: password
      click_button "Register"

      expect(current_path).to eq('/dashboard')
    end
  end

  describe 'sad path and edge case' do
    it 'email field cannot be blank' do

      password = "test"
      fill_in "user[password]", with: password
      fill_in "user[password_confirmation]", with: password
      click_button "Register"

      blank_email_notice = "Email can't be blank"

      expect(page).to have_content(blank_email_notice)
    end

    it 'password field cannot be blank' do

      email = "example@example.com"
      fill_in "user[email]", with: email
      click_button "Register"

      blank_password_notice = "Password can't be blank"

      expect(page).to have_content(blank_password_notice)
    end

    it 'must be a valid email format' do

      fill_in "user[email]", with: "iloveMovies.com"
      fill_in "user[password]", with: "password"
      fill_in "user[password_confirmation]", with: "password"
      click_on "Register"

      invalid_email = "Email is invalid"

      expect(page).to have_content(invalid_email)
    end

    it 'cannot register with existing account email' do
      email = "example@example.com"
      password = "test"
      fill_in "user[email]", with: email
      fill_in "user[password]", with: password
      fill_in "user[password_confirmation]", with: password
      click_button "Register"

      expect(current_path).to eq('/dashboard')

      visit "/registration"

      fill_in "user[email]", with: email
      fill_in "user[password]", with: password
      fill_in "user[password_confirmation]", with: password
      click_button "Register"

      account_exists = "Email has already been taken"

      expect(page).to have_content(account_exists)
    end

    it 'password and password confirmation must match' do
      email = "example@example.com"
      password = "test"
      fill_in "user[email]", with: email
      fill_in "user[password]", with: password
      fill_in "user[password_confirmation]", with: "wrong0password"
      click_button "Register"
      
      confirmation_error = "Password confirmation doesn't match Password"

      expect(page).to have_content(confirmation_error)
    end
  end
end
