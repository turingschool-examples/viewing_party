require 'rails_helper'

RSpec.describe "Dashboard" do
  before :each do
    @user = User.create!(name: "name", email: "email@gmail.com", password: "password")
    visit root_path

      within(".login") do
        fill_in :email, with: @user.email
        fill_in :password, with: @user.password
        click_button("Log In")
      end
  end

  describe "when I visit a user dashboard it" do
    it "has a welcome header" do
      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Welcome #{@user.name}!")
    end

    it "has a button to discover movies" do
      expect(page).to have_button("Discover Movies")

      click_button "Discover Movies"

      expect(current_path).to eq(discover_path)
    end

    it "has a friends section" do
      within "#friends-#{@user.id}" do
        expect(page).to have_content("Friends")
        expect(page).to have_content("You have no one on your friends list yet")
        expect(page).to have_field("Friend's Email:")
        expect(page).to have_button("Add Friend")
      end

      it "has a viewing party section" do
        within "#viewing_party#{@user.id}" do
          expect(page).to have_content("Viewing Party")
        end
      end
    end
  end
end
