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
      it "It contains a text field to enter a friend's email and a button to Add Friend do" do
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
    end
  end
end
