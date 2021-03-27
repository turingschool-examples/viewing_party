require 'rails_helper'

RSpec.describe "As an authenticated user" do
  describe "when I navigate to create a new party from Fight Club" do
    it "has a form to fill out attributes" do
      VCR.use_cassette('viewing_party_path') do
        user = User.create(email: "joeb@email.com", password: "test")
        visit root_path
        click_link "Login"
        fill_in :email, with: user.email.upcase
        fill_in :password, with: user.password
        click_button 'Login'
        within(".topnav") do
          click_link "Discover Movies"
        end

        fill_in :movie_query, with: "Fight Club"
        click_on("Find Movies")
        click_link "Fight Club"

        click_button("Create Viewing Party for Movie")

        expect(page).to have_content("Movie Title:")
        expect(page).to have_content("Date and Time of Event:")
        expect(page).to have_content("Duration:")
      end
    end
    it "creates a party object when the form is submitted" do
      VCR.use_cassette('viewing_party_path') do
        user = User.create(email: "joeb@email.com", password: "test")
        visit root_path
        click_link "Login"
        fill_in :email, with: user.email.upcase
        fill_in :password, with: user.password
        click_button 'Login'
        within(".topnav") do
          click_link "Discover Movies"
        end

        fill_in :movie_query, with: "Fight Club"
        click_on("Find Movies")
        click_link "Fight Club"

        click_button("Create Viewing Party for Movie")


        fill_in :duration, with: 200
        fill_in ':date', with: "12/12/21"
        click_on "Create Party"

        expect(current_path).to eq(dashboard_path(user))
      end
    end
  end
end
