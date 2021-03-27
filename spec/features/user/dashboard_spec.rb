require 'rails_helper'

RSpec.describe "User Dashboard" do
  describe "Discover Movies Button" do
    it "Redirects user to a discover page when button is clicked" do
      user = User.create(email: "joeb@email.com", password: "test")
      visit root_path

      click_link "Login"

      fill_in :email, with: user.email.upcase
      fill_in :password, with: user.password
      click_button 'Login'

      within(".topnav") do
        expect(page).to have_link("Discover Movies")

        click_link "Discover Movies"
      end

      expect(current_path).to eq(discover_path)
    end
  end

  describe "Viewing Parties Section" do
    it "displays all the details for viewing parties user is invited to" do
      user = User.create(email: "funbucket13@example.com", password: "test")

      visit root_path

      click_link 'Login'

      expect(current_path).to eq(login_path)

      fill_in :email, with: "funbucket13@example.com"
      fill_in :password, with: "test"

      click_button 'Login'

      expect(page).to have_content("Viewing Parties")

      within("#invited-viewing-parties") do
        expect(page).to have_content("Movie Title:")
        expect(page).to have_content("Date and Time of Event:")
        expect(page).to have_content("Hosting:")
        expect(page).to have_content("Invited: #{user.email}")
      end
    end

    it "shows viewing parties created by user(host) with all the details" do
      user = User.create(email: "funbucket13@example.com", password: "test")

      visit root_path

      click_link 'Login'

      expect(current_path).to eq(login_path)

      fill_in :email, with: "funbucket13@example.com"
      fill_in :password, with: "test"

      click_button 'Login'

      expect(page).to have_content("Viewing Parties")

      within("#hosting-viewing-parties") do
        expect(page).to have_content("Movie Title:")
        expect(page).to have_content("Date and Time of Event:")
        expect(page).to have_content("Hosting: #{user.email}")
        expect(page).to have_content("Invited:")
      end
    end
  end

  describe "Friends Section" do
    describe "happy path" do
      it "has a text field to search friends by email and button to add friends" do
        user1 = User.create(email: "funbucket13@example.com", password: "test")
        user2 = User.create(email: "user@example.com", password: "password")
        friend1 = Friendship.users.create(user_id: user1.id, friendship_id: user2.id)
        friend2 = Friendship.users.create(user_id: user2.id, friendship_id: user1.id)
        require "pry"; binding.pry
        visit root_path

        click_link 'Login'

        expect(current_path).to eq(login_path)

        fill_in :email, with: "funbucket13@example.com"
        fill_in :password, with: "test"

        click_button 'Login'


        within("#friends-#{user.id}") do
          expect(page).to have_content("Friends")
          expect(page).to have_field(:email)
          expect(page).to have_content("You currently have no friends")
          expect(page).to have_button("Add Friend")
        end
      end
    end
  end
end
