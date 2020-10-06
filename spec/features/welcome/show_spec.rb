require 'rails_helper'
include ActionView::Helpers::NumberHelper

RSpec.describe 'Welcome Page' do
  describe 'As a user' do
    before :each do
      visit '/'
    end

    it "I can see a welcome message" do
      expect(page).to have_content("Welcome to Viewing Party!")
    end

    it "I can see a brief description of the application" do
      expect(page).to have_content("This is the premier website for planning your next movie night!")
    end

  end
end

#  Welcome message
#  Brief description of the application
#  Button to Log in
#  Link to Registration
# Details: Implement basic auth in the application allowing a user to log in with an email and password. The password should be stored in the database using bcrypt.
