require 'rails_helper'
describe "As an authenticated user, when I visit '/dashboard'" do
  before :each do
    @user_1 = User.create!(email: 'sassy@email.com', password: 'sassyperson1')
    @user_2 = User.create!(email: 'grumpy@email.com', password: 'grumpyperson1')
    @user_3 = User.create!(email: 'sleepy@email.com', password: 'sleepyperson1')
  end

  it "I see a welcome message with the name of the user" do
    visit root_path

    fill_in "email", with: @user_1.email
    fill_in "password", with: 'sassyperson1'

    click_button "Sign In"

    expect(current_path).to eq(dashboard_index_path)
    expect(page).to have_content("Welcome, #{@user_1.email}")
  end

  describe "I see a friends section" do
    it "I see a message if I do not have any friends yet" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_1)

      visit dashboard_index_path

      expect(page).to have_content("You currently have no friends")
    end

    it "I see a search box to add friends, if my friend is found they are added to my list" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_1)

      visit dashboard_index_path

      fill_in :email, with: "#{@user_2.email}"
      click_button 'Add Friend'

      expect(current_path).to eq(dashboard_index_path)

      within ".user-friends" do
        expect(page).to have_content("#{@user_2.email}")
        expect(page).to_not have_content("#{@user_3.email}")
      end
    end

    it "If I search for someone not registered, I receive a message" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_1)
      no_one = 'notanyones@email.com'

      visit dashboard_index_path

      fill_in :email, with: no_one
      click_button 'Add Friend'

      expect(current_path).to eq(dashboard_index_path)
      expect(page).to have_content("#{no_one.titleize} cannot be found. Search for another friend")

      within ".user-friends" do
        expect(page).to_not have_content('notanyones@email.com')
      end
    end

    it "I cannot add myself as a friend" do

    end
  end

  describe "I see a button to discover movies" do
    it "when I click this button I am taken to '/discover'" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_1)

      visit dashboard_index_path

      click_button("Discover Movies")

      expect(current_path).to eq(discover_index_path)
    end
  end

  describe "I see a viewing party section" do
    it "I see any viewing parties I am hosting" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_1)

      visit dashboard_index_path

      expect(page).to have_content("Viewing Parties")
    end

    it "I see any viewing parties I am invited to" do

    end
  end
end

describe "as an unauthenticated user, when I visit '/dashboard'" do
  it "I receive a 401 error" do
    visit dashboard_index_path

    expect(page).to have_content("You do not have authorization to access this page.")
  end
end
