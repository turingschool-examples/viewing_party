require 'rails_helper'

RSpec.describe 'As a verified user' do
  before(:each) do
    stub_omniauth
    @user1 = User.create(name: "Bugs", email:"bugs_bunny@gmail.com")
    @user2 = User.create(name: "Lola", email:"lola_bunny@gmail.com")
    visit root_path
    expect(page).to have_link("Sign in with Google")
    click_link "Sign in with Google"
  end

  describe 'When I log in' do
    it 'see\s a dashboard that welcomes me' do

      expect(current_path).to eq("/dashboard")
      expect(page).to have_content("Welcome Tony Stark!")
      expect(page).to have_css ".friends"
      expect(page).to have_button("Discover Movies")
      expect(page).to have_css(".viewing_parties")
    end

    it "on the dashboard I can add friends" do
      within ".friends" do

        page.find_field("email")
        expect(page).to have_button "Add Friend"
        expect(page).to have_content "You have no Friends"
      end
    end


    it "can add a friend" do
      fill_in('email', with: 'lola_bunny@gmail.com')
      click_on("Add Friend")
      expect(page).to have_content("lola_bunny@gmail.com")
      expect(page).to_not have_content("You have no Friends")
    end

    it "should give an error message when adding a friend that does not exist" do
      fill_in('email', with: 'daffy_duck@gmail.com')
      click_on("Add Friend")
      expect(page).to have_content("daffy_duck@gmail.com does not exist in our database")
      expect(page).to have_content("You have no Friends")
    end
  end
end
