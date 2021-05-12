require 'rails_helper'
# When a user visits the '/registration' path they should see a form to register.
# The form should include:
#
#  Email
#  Password
#  Password Confirmation
#  Register Button
#  Once the user registers they should be logged in and redirected to the dashboard page

RSpec.describe 'Registration', type: :feature do
  describe 'Registration Page' do
    it "I can create a new user and save that user to the db" do
      visit root_path

      click_link "Sign Up to Be a User"

      expect(current_path).to eq("/register")

      fill_in 'user[email]', with: "klaw@test.com"
      fill_in 'user[password]', with: "test123"
      #add password_confirmation
      click_button "Register"

      expect(current_path).to eq(dashboard_path)
      new_user = User.last

      expect(page).to have_content("Welcome, klaw@test.com!")
    end
  end
end
