require 'rails_helper'

RSpec.describe "As a registered user" do
  describe "on dashboard show page" do
    before :each do
      @user = User.create!(username: "Quentin", email: "tarantino@gmail.com")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    end
    it "can access the discover page from the dashboard" do
      visit '/dashboard'

      expect(page).to have_link("Discover Movies!")

      click_on "Discover Movies!"

      expect(current_path).to eq('/dashboard/discover')
    end
  end
  describe "on dashboard show page" do
    before :each do
      @user = User.create!(username: "Quentin", email: "tarantino@gmail.com")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    end
    it "has a link to discover top movies" do
      visit '/dashboard/discover'

      expect(page).to have_button("Find Top Rated Movies")

      click_on "Find Top Rated Movies"

      expect(current_path).to eq('/movies')
    end
    it "has a friends section that is empty if no friendships" do
      visit '/dashboard'

      expect(page).to have_content("Friends")
      expect(page).to have_content("You currently have no friends")
      expect(page).to have_button("Add Friend")
    end
  end
end
