require 'rails_helper'

RSpec.describe "Registration Page" do
  describe 'user registration page' do
    it 'creates new user' do
      visit root_path

      click_link 'Link to Registration'

      email = 'andrew@smith.com'
      password = 'smith'
      confirm_password = 'smith'

      fill_in 'user[email]', with: email
      fill_in 'user[password]', with: password
      fill_in 'user[password_confirmation]', with: confirm_password

      click_on 'Register'
save_and_open_page
      expect(page).to have_content("Welcome, #{email}!")
    end

    it 'sad path' do
      visit root_path

      click_link 'Link to Registration'

      email = 'andrew@smith.com'
      password = 'smith'
      confirm_password = 'smiths'

      fill_in 'user[email]', with: email
      fill_in 'user[password]', with: password
      fill_in 'user[password_confirmation]', with: confirm_password

      click_on 'Register'

      expect(page).to have_content("Password confirmation doesn't match Password for #{email}! Please try again!")
    end
  end
end