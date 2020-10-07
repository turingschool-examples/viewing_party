require 'rails_helper'
include ActionView::Helpers::NumberHelper

RSpec.describe 'Dashboard Page' do
  describe 'As a user' do
    before :each do
      @user_1 = User.create(name: 'Jackie Chan', email: 'a@a.com', password: 'a')
      @user_2 = User.create(name: 'Cynthia Rothrock', email: 'b@b.com', password: 'a')
      @user_3 = User.create(name: 'Michelle Yeoh', email: 'c@c.com', password: 'a')
      @user_4 = User.create(name: 'Bilbo Baggins', email: 'd@d.com', password: 'a')

      @friendship_1 = Friendship.create(user_id: @user_1.id, friend_id: @user_2.id)
      @friendship_2 = Friendship.create(user_id: @user_1.id, friend_id: @user_3.id)

      @viewing_party_1 = ViewingParty.create(movie_title: "Big City", host: @user_1, date: "June 26th, 1997", time: "12:45pm")

      @party_invites_1 = ViewingParty.create(viewing_party_id: @viewing_party_1.id, user_id: @user_2.id, status: 0)

      visit root_path

      fill_in 'Email', with: @user_1.email
      fill_in 'Password', with: @user_1.password

      click_button "Log In"
    end

    it "I can see a personalized welcome message after logging in" do
      expect(page).to have_content('Welcome, Jackie Chan, you are logged in!')
    end

    it "I can see a personalized greeting if I navigate away, and navigate back" do
      visit root_path
      visit 'user/dashboard'

      expect(page).to have_content('Welcome Jackie Chan!')
    end

    it "I can see a button to Discover Movies" do
      expect(page).to have_button('Discover Movies')
    end

    it "I can see a section showing my friends" do
      expect(page).to have_content("Friends:")
      expect(page).to have_content("Cynthia Rothrock")
      expect(page).to have_content("Michelle Yeoh")
      expect(page).to_not have_content("Bilbo Baggins")
    end

  end
end
