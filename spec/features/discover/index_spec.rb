require 'rails_helper'

RSpec.describe 'Movie Discover Page' do
  describe 'As a registered user' do
    before :each do
      @user = User.create!(email: "John@example.com", password: "password")
      visit root_path

      fill_in :email, with: @user.email
      fill_in :password, with: @user.password

      click_button("Log In")
    end

    it "I see a find top rated movies button and a search by movie title field" do
      visit '/discover'

      expect(page).to have_content("Welcome, #{@user.email}")
      expect(page).to have_button("Find Top Rated Movies")
      expect(page).to have_field("Search by movie title")
      expect(page).to have_button("Find Movies")
    end
  end
end
