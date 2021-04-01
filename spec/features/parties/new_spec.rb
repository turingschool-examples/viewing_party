require 'rails_helper'

RSpec.describe "New Party Page" do
  describe "As an authenticated user When I visit the new viewing party page" do
    it "I should see the name of the movie title rendered above a form with some fields" do
      user = User.create(password: "hello", email: "sample@email.com")
      follower_1 = User.create(password: "hello1", email: "sample12@email.com")
      follower_2 = User.create(password: "hello2", email: "sample45@email.com")
      Follow.create!(follower_id: follower_1.id, followee_id: user.id)
      Follow.create!(follower_id: follower_2.id, followee_id: user.id)
      visit root_path
      click_on "Log In!"
      fill_in :email, with: user.email
      fill_in :password, with: user.password
      click_on "Log In"
      VCR.use_cassette('new_party_1') do
      visit new_party_path({ movie_id: 550 })
        within "#party-info" do
          expect(page).to have_css("#movie-title")
          expect(page).to have_field("party[duration]")
          expect(page).to have_field("party[date]")
          expect(page).to have_field("party[time]")
          expect(page).to have_content("Include")
          expect(page).to have_content(follower_1.email)
          expect(page).to have_content(follower_2.email)
        end
      end
    end
    it "it does not display friends to Include if the user has no friends" do
      user = User.create(password: "hello", email: "sample@email.com")
      follower_1 = User.create(password: "hello1", email: "sample12@email.com")
      follower_2 = User.create(password: "hello2", email: "sample45@email.com")
      visit root_path
      click_on "Log In!"
      fill_in :email, with: user.email
      fill_in :password, with: user.password
      click_on "Log In"
      VCR.use_cassette('new_party_2') do
      visit new_party_path({ movie_id: 550 })
        within "#party-info" do
          expect(page).to_not have_content("Include")
          expect(page).to_not have_content(follower_1.email)
          expect(page).to_not have_content(follower_2.email)
        end
      end
    end
    it "can create a new party by entering the required info" do
      user = User.create(password: "hello", email: "sample@email.com")
      follower_1 = User.create(password: "hello1", email: "sample12@email.com")
      follower_2 = User.create(password: "hello2", email: "sample45@email.com")
      Follow.create!(follower_id: follower_1.id, followee_id: user.id)
      Follow.create!(follower_id: follower_2.id, followee_id: user.id)
      visit root_path
      click_on "Log In!"
      fill_in :email, with: user.email
      fill_in :password, with: user.password
      click_on "Log In"
      VCR.use_cassette('new_party_3') do
      visit new_party_path({ movie_id: 550 })
        within "#party-info" do
          fill_in "party[duration]", with: 180
          fill_in "party[date]", with: "04/01/2021"
          fill_in "party[time]", with: "1:00 PM"
          within "#follower-#{follower_1.id}" do
            page.check("invited_#{follower_1.id}")
          end
          within "#follower-#{follower_2.id}" do
            page.check("invited_#{follower_2.id}")
          end
          click_button("Create Party")
        end
      end
    end
    it "displays error message if any of the info in not entered" do
      user = User.create(password: "hello", email: "sample@email.com")
      follower_1 = User.create(password: "hello1", email: "sample12@email.com")
      follower_2 = User.create(password: "hello2", email: "sample45@email.com")
      Follow.create!(follower_id: follower_1.id, followee_id: user.id)
      Follow.create!(follower_id: follower_2.id, followee_id: user.id)
      visit root_path
      click_on "Log In!"
      fill_in :email, with: user.email
      fill_in :password, with: user.password
      click_on "Log In"
      VCR.use_cassette('new_party_4') do
        visit new_party_path({ movie_id: 550 })
          within "#party-info" do
            click_button("Create Party")
          end
          expect(page).to have_content("Please enter the correct information")
      end
    end
  end
end