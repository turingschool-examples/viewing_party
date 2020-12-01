require 'rails_helper'

RSpec.describe 'Welcome Page' do
  describe 'As a Visitor' do
    it "I see a welcome message and app description" do
      visit root_path

      expect(page).to have_content("Welcome to Viewing Party!")
      expect(page).to have_content("Here you can schedule to watch movies with all of your friends!")
    end

    it "I can see a log in button and a registration link" do
      visit root_path

      expect(page).to have_field("Email")
      expect(page).to have_field("Password")
      expect(page).to have_button("Log In")
      expect(page).to have_link("First Time? Register Here")
    end
  end
end
