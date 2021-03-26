require 'rails_helper'

RSpec.describe "Discover index page" do
  describe "As an unauthenticated user" do
    describe "when I visit the discover index page it" do
      it "redirects me to the login page with a flash message" do
        visit discover_path

        expect(current_path).to eq(root_path)
        expect(page).to have_content("You must be logged in to view this page")
      end
    end
  end

  describe "as an unauthenticated user" do
    before :each do
      @user = User.create!(name: "Name", email: "email@domain.com", password: "password")
      visit root_path
      fill_in :email, with: @user.email
      fill_in :password, with: @user.password
      click_button "Log In"
    end

    describe "when I visit the discover index page it" do
      it "shows a link to find the top rated movies" do
        visit discover_path

        expect(page).to have_button('Find Top Rated Movies')
      end
    end
  end
end
