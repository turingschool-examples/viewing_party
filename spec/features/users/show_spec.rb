require 'rails_helper'

RSpec.describe 'User Dashboard Page' do
  describe 'As a registered user' do
    before :each do
      @user = User.create!(email: "John@example.com", password: "password")
      @friend = User.create!(email: "Todd@example.com", password: "password")

      visit root_path

      fill_in :email, with: @user.email
      fill_in :password, with: @user.password

      click_button("Log In")
    end

    it "I see discover movies button, friends search bar, add friend button, and my viewing parties tab" do
      expect(current_path).to eq(dashboard_path)

      expect(page).to have_button("Discover Movies")
      expect(page).to have_button("Add Friend")
      expect(page).to have_field(:friend_email)
      expect(page).to have_content("Viewing Parties")
    end

    it "I can click on the discover movies button and be taken to that page" do
      click_button("Discover Movies")

      expect(current_path).to eq('/discover')
    end

    describe 'I enter an email into the friend search field' do
      it "The email I enter is valid and registered on the site " do
        expect(current_path).to eq(dashboard_path)

        within '.friends' do
          expect(page).to have_content("You currently have no friends")
        end

        fill_in :friend_email, with: @friend.email
        click_button 'Add Friend'

        expect(current_path).to eq(dashboard_path)

        within '.friends' do
          expect(page).to have_content(@friend.email)
        end
      end

      it "The email I enter is invalid/user does not exist" do
        expect(current_path).to eq(dashboard_path)

        fill_in :friend_email, with: 'meow'
        click_button 'Add Friend'

        expect(current_path).to eq(dashboard_path)
        expect(page).to have_content("I'm sorry your friend cannot be found")

        within '.friends' do
          expect(page).to have_content("You currently have no friends")
        end
      end
    end

    describe "I see a section with my viewing parties" do
      before :each do
        @friend_2 = @user.friends.create!(email: "Carson@example.com", password: "password")
        @friend_3 = @user.friends.create!(email: "Charlie@example.com", password: "password")
        @friend_2.friends << @user
        @friend_2.friends << @friend_3

        @party_1 = @user.parties.create!(movie_title: "Some Like It Hot", duration: "189", day: "2022-2-28", start_time: "12:37")
        Guest.create!(party_id: @party_1.id, user_id: @friend_2.id)
        Guest.create!(party_id: @party_1.id, user_id: @friend_3.id)
      end

      it "I see viewing parties I am hosting" do
        visit dashboard_path
        within "#party-#{@party_1.id}" do
          expect(page).to have_content("Some Like It Hot")
          expect(page).to have_content("2/28/2022")
          expect(page).to have_content("12:37 PM")
          expect(page).to have_content("Hosting")
        end
      end

      it "I see viewing parties I was invited to" do
        click_on "Log Out"

        fill_in :email, with: @friend_2.email
        fill_in :password, with: @friend_2.password
        click_button("Log In")

        party_2 = @friend_2.parties.create!(movie_title: "The Godfather: Part II", duration: "300", day: "2025-7-2", start_time: "21:47")
        Guest.create!(party_id: party_2.id, user_id: @user.id)
        Guest.create!(party_id: party_2.id, user_id: @friend_3.id)

        visit dashboard_path

        within "#party-#{@party_1.id}" do
          expect(page).to have_content("Some Like It Hot")
          expect(page).to have_content("2/28/2022")
          expect(page).to have_content("12:37 PM")
          expect(page).to have_content("Invited")
        end

        within "#party-#{party_2.id}" do
          expect(page).to have_content("The Godfather: Part II")
          expect(page).to have_content("7/2/2025")
          expect(page).to have_content("9:47 PM")
          expect(page).to have_content("Hosting")
        end
      end
    end
  end
end
