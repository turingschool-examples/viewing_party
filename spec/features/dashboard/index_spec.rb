require 'rails_helper'

RSpec.describe "Dashboard" do
  describe "as a logged in user (happy path)" do
    describe "the Friends panel" do
      before(:each) do
        

        @jamie = User.create!(email: "jamie@email.org", password: "password1", password_confirmation: "password1")
        @kelsey = User.create!(email: "kelsey@email.org", password: "dsaffssddsa", password_confirmation: "dsaffssddsa")
        @bobby = User.create(email: "bobby@email.org", password: "axcver", password_confirmation: "axcver")
        @jane = User.create(email: "jane@email.org", password: "dsarertgfffsdsa", password_confirmation: "dsarertgfffsdsa")
        @elisa = User.create(email: "elisa@email.org", password: "eutkjgkx", password_confirmation: "eutkjgkx")
        @allie = User.create(email: "allie@email.org", password: "eutkjgasdvkx", password_confirmation: "eutkjgasdvkx")
        @jason = User.create!(email: "jason@email.org", password: "eutkjgasdweewvkx", password_confirmation: "eutkjgasdweewvkx")

        Follow.create(follower_id: @elisa.id, followee_id: @jamie.id)
        Follow.create(follower_id: @bobby.id, followee_id: @jamie.id)
        Follow.create(follower_id: @allie.id, followee_id: @jamie.id)
        Follow.create(follower_id: @jane.id, followee_id: @jamie.id)

        Follow.create(follower_id: @jamie.id, followee_id: @kelsey.id)
        Follow.create(follower_id: @jamie.id, followee_id: @bobby.id)
        Follow.create(follower_id: @jamie.id, followee_id: @elisa.id)

        visit root_path
        
        fill_in "email", with: "jamie@email.org"
        fill_in "password", with: "password1"
        click_on "Log In"
      end
  
      it "has a list of user's followers" do
        visit dashboard_path

        within("#followers-panel") do
          expect(page).to have_content(@bobby.email)
          expect(page).to have_content(@jane.email)
          expect(page).to have_content(@elisa.email)
          expect(page).to have_content(@allie.email)
        end
      end
  
      it "lets users search for existing users and follow in follower panel" do
        within("#followers-panel") do
          fill_in "query", with: @jane.email
          click_button "Follow Friend"
        end

        expect(page).to have_content("You are now following #{@jane.email}!")
      end

      it "can handle searching for email that doesn't exist" do
        within("#followers-panel") do
          fill_in "query", with: "albert@email.org"
          click_button "Follow Friend"

        end

        expect(page).to have_content("User doesn't exist!")
      end

      it "has a followee panel" do
        visit dashboard_path

        within("#followees-panel") do
          expect(page).to have_content(@bobby.email)
          expect(page).to have_content(@kelsey.email)
          expect(page).to have_content(@elisa.email)
        end
      end

      it "indicates to a user when they have zero followers/ followees" do
        visit dashboard_path

        click_link "Log out"

        expect(current_path).to eq(root_path)

        fill_in "email", with: "jason@email.org"
        fill_in "password", with: "eutkjgasdweewvkx"
        click_on "Log In"

        within("#followers-panel") do
          expect(page).to have_content("You have no followers")
        end
        within("#followees-panel") do
          expect(page).to have_content("You aren't following anyone")
        end
      end
    end

  end
end