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
      visit root_path

      fill_in "email", with: @user_2.email
      fill_in "password", with: 'grumpyperson1'
      click_button "Sign In"

      expect(current_path).to eq(dashboard_index_path)
      expect(page).to have_content("You currently have no friends")
    end

    it "I see a search box to add friends, if my friend is found they are added to my list" do
    end

    it "If I search for someone not registered, I receive a message 'Friend cannot be found'" do
    end
  end

  describe "I see a button to discover movies" do
    it "when I click this button I am taken to '/discover'" do
      visit root_path

      fill_in "email", with: @user_2.email
      fill_in "password", with: 'grumpyperson1'
      click_button "Sign In"

      expect(current_path).to eq(dashboard_index_path)

      click_button("Discover Movies")

      expect(current_path).to eq(discover_index_path)
    end
  end

  describe "I see a viewing party section" do
    it "I see any viewing parties I am hosting" do
      visit root_path

      fill_in "email", with: @user_2.email
      fill_in "password", with: 'grumpyperson1'
      click_button "Sign In"

      expect(current_path).to eq(dashboard_index_path)
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
