require 'rails_helper'

RSpec.describe "Dashboard Index Page" do
  describe "As an authenticated user" do
    describe "when I visit my dashboard index page" do
      it "it displays my email" do
        user = User.create(password: "hello", email: "sample@email.com")
        visit root_path
        click_on "Log In!"
        fill_in :email, with: user.email
        fill_in :password, with: user.password
        click_on "Log In"
        visit dashboard_path
          within "#userInfo" do
            expect(page).to have_content("Welcome #{user.email}!")
          end
      end
    end
    describe "it has button to discover movies page" do
      it "clicking discover button takes me to the page" do
        user = User.create(password: "hello", email: "sample@email.com")
        visit root_path
        click_on "Log In!"
        fill_in :email, with: user.email
        fill_in :password, with: user.password
        click_on "Log In"
        visit dashboard_path
          within "#discover-movies-link" do
            expect(page).to have_link("Discover Movies")
            click_link("Discover Movies")
          end
        expect(current_path).to eq(discover_path)
      end
    end
    describe "I see a section for friends" do
      it "It contains a text field to enter a   friend's email and a button to Add Friend" do
        user = User.create(password: "hello", email: "sample@email.com")
        visit root_path
        click_on "Log In!"
        fill_in :email, with: user.email
        fill_in :password, with: user.password
        click_on "Log In"
        visit dashboard_path
        within "#friends" do
          expect(page).to have_field(:friend_email)
          expect(page).to have_button("Add Friend")
          expect(page).to have_content("You currently have no friends.")
        end
      end
      it "When I enter a valid email into the field and click add friend, a new friend is added" do
        user_1 = User.create(password: "hello", email: "sample@email.com")
        user_2 = User.create(password: "hello", email: "sample_1@email.com")
        visit root_path
        click_on "Log In!"
        fill_in :email, with: user_2.email
        fill_in :password, with: user_2.password
        click_on "Log In"
        visit dashboard_path
          within("#friends") do
            fill_in :friend_email, with: user_1.email
            click_button("Add Friend")
          end
        expect(current_path).to eq(dashboard_path)
        expect(page).to have_content(user_1.email)
      end
      it "When I enter an invalid email into the field and click add friend, a new friend is not added" do
        user_1 = User.create(password: "hello", email: "sample@email.com")
        user_2 = User.create(password: "hello", email: "sample_1@email.com")
        visit root_path
        click_on "Log In!"
        fill_in :email, with: user_2.email
        fill_in :password, with: user_2.password
        click_on "Log In"
        visit dashboard_path
          within("#friends") do
            fill_in :friend_email, with: "ample_1@email.com"
            click_button("Add Friend")
          end
        expect(current_path).to eq(dashboard_path)
        expect(page).to_not have_content(user_1.email)
        expect(page).to have_content("Incorrect email")
      end
      it "When I enter a valid email into the field and click add friend, a new friend is added" do
        user_1 = User.create(password: "hello", email: "sample@email.com")
        user_2 = User.create(password: "hello", email: "sample_1@email.com")
        visit root_path
        click_on "Log In!"
        fill_in :email, with: user_2.email
        fill_in :password, with: user_2.password
        click_on "Log In"
        visit dashboard_path
          within("#friends") do
            fill_in :friend_email, with: user_1.email
            click_button("Add Friend")
          end
        expect(current_path).to eq(dashboard_path)
        expect(page).to have_content(user_1.email)
        click_button("Unfollow")
        expect(current_path).to eq(dashboard_path)
        expect(page).to_not have_content(user_1.email)
      end
    end
  end
end
