require 'rails_helper'

RSpec.describe "Movies index page" do
  describe "As an authenticated user" do
    before :each do
      @user = User.create!(name: "Name", email: "email@domain.com", password: "password")
      visit root_path
      fill_in :email, with: @user.email
      fill_in :password, with: @user.password
      click_button "Log In"
    end

    describe "When I visit the movies page it" do
      it "shows the 'Find Top Rated Movies' button at the top of the page" do
        visit movies_path

        expect(page).to have_button('Find Top Rated Movies')
      end
    end
  end
end
