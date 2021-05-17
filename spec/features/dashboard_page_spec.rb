require 'rails_helper'

RSpec.describe 'Dashboard', type: :feature do
  before(:each) do
    # user = User.create!(email: "ClaSte@hotmail.com", password: "1234", password_confirmation: "1234" )
    # login(user)
  end

  describe 'Dashboard Page' do
    it 'I can see welcome username at the top of the page' do
      expect(current_path).to eq("/dashboard")
      expect(page).to have_content("Welcome, #{user.email}!")
    end

    it "I can see and click a button to discover movies" do
      visit dashboard_index_path

      expect(page).to have_button("Discover Movies")

      click_button "Discover Movies"

      expect(current_path).to eq(discover_path)
    end

    it 'I can see a friends section' do
      visit dashboard_index_path

      expect(current_path).to eq(dashboard_index_path)
      expect(page).to have_content("Friends")
    end

    it 'I can see a viewing parties section' do
      visit dashboard_index_path

      expect(current_path).to eq(dashboard_index_path)
      expect(page).to have_content("Viewing Parties")
    end

    it 'can search for a friend and add them' do
      user = User.create!(email: "ClaSte@hotmail.com", password: "1234", password_confirmation: "1234" )
      user_2 = User.create!(email: "email", password: "1234", password_confirmation: "1234" )
      visit root_path

      fill_in :email, with: user.email
      fill_in :password, with: user.password
      click_on("Log In")
      fill_in :friend_search, with: "#{user_2.email}"
      click_button "Add friend"

      expect(page).to have_content(user_2.email)
      expect(user.friends.count).to eq(1)
    end

    it 'says you currently have no friends if you have not added a friend yet' do
      expect(page).to have_content("You currently have no friends.")
    end

    it 'has a sad path message if a the email that is entered is not a user and the user does not add that frined' do
      user = User.create!(email: "ClaSte@hotmail.com", password: "1234", password_confirmation: "1234" )
      visit root_path

      fill_in :email, with: user.email
      fill_in :password, with: user.password
      click_on("Log In")
      fill_in :friend_search, with: "non_exisitng_email"
      click_button "Add friend"

      expect(page).to have_content("I'm sorry your frined cannot be found")
      expect(user.friends.count).to eq(0)
      expect(current_path).to eq(dashboard_index_path)
    end
  end
end
