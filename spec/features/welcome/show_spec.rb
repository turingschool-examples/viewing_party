require 'rails_helper'
include ActionView::Helpers::NumberHelper

RSpec.describe 'Welcome Page' do
  describe 'As a user' do
    before :each do
      @user = User.create(name: 'Jackie Chan', email: 'a@a.com', password: 'a')

      visit root_path
    end

    it "I can see a welcome message" do
      expect(page).to have_content("Welcome to Viewing Party!")
    end

    it "I can see a brief description of the application" do
      expect(page).to have_content("This is the premier website for planning your next movie night!")
    end

    it "I can see a button to log in" do
      expect(page).to have_button("Log In")
    end

    it "I can fill in my information, click the Log In button, and be logged in" do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password

      click_button "Log In"

      expect(current_path).to eq("/user/dashboard")
    end

    it "I can see a link to register" do
      expect(page).to have_link("Register")
    end

    # it "I can click link to register, and am taken to the register page" do
    #   click_link "Register"
    #
    #   expect(current_path).to eq("/register")
    # end

  end
end

# Details: Implement basic auth in the application allowing a user to log in with an email and password. The password should be stored in the database using bcrypt.
