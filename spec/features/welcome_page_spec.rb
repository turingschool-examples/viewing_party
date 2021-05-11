require 'rails_helper'

RSpec.describe 'Welcome Page', type: :feature do
  describe 'Weclome Page and Log In' do
    it "When a user visits the root path they should be on the welcome page which includes:
      Welcome message
      Brief description of the application
      Button to Log in
      Link to Registration
      (Details: Implement basic auth in the application allowing a user to log in with an email and password. The password should be stored in the database using bcrypt)." do
      user = User.create(username: "ClaSte", password: "1234")
      visit root_path
      expect(page).to have_content("Welome! We're Glad You're Here! At Viewing Party, we make it easy to watch a movie with friends from th")
      fill_in :username, with: user.username
      fill_in :password, with: user.password

      click_on "Log In"

      expect(current_path).to eq(root_path)
      expect(page).to have_content("Welcome, #{user.username}!We're Glad You're Here! At Viewing Party, we make it easy to watch a movie with friends from th")
    end
  end
end