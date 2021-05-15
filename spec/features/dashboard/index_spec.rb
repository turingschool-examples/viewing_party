require 'rails_helper'

RSpec.describe "dashboard page" do
  before :each do
    @user = User.create!(email: "fav@email.com", username: "bestuser", password: "veryhardpassword")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit dashboard_path
  end

  it "includes a welcome message" do

    expect(page).to have_content("Welcome #{@user.username}!")
  end

  it "includes a button that takes us to the discover movies page" do

    expect(page).to have_button('Discover Movies')
    click_button('Discover Movies')
    expect(current_path).to eq(discover_path)
  end

  describe "friends section" do
    it "includes a friends header and a field and button to search for friends" do

      expect(page).to have_content("Friends")
      expect(page).to have_field("email")
      expect(page).to have_button("Add Friend")
    end

    it "I see a message if I do not have any friends yet" do

      expect(page).to have_content("You currently have no friends")
    end

    it "can search by email for another user, if user is found they are added to my followers" do

      user2 = User.create!(email: "test2@email.com", username: "user2", password: "veryhardpassword2")
      user3 = User.create!(email: "test3@email.com", username: "user3", password: "veryhardpassword3")

      fill_in :email, with: user2.email
      click_button 'Add Friend'

      expect(current_path).to eq(dashboard_path)

      within ".user-friends" do
        expect(page).to have_content("#{user2.username}")
        expect(page).to_not have_content("#{user3.username}")
      end
    end

    it "If I search for someone who is not a user, I receive a message" do
      not_registered = 'notanyones@email.com'

      fill_in :email, with: not_registered
      click_button 'Add Friend'

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("#{not_registered.titleize} cannot be found. Search for another friend")

      within ".user-friends" do
        expect(page).to_not have_content(not_registered)
      end
    end

    it "cannot add yourself as a friend" do

    end

    end
  end
end
