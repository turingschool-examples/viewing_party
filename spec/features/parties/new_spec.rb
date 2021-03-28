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

        expect(page).to have_content("Movie Title: Fight Club")
        expect(page).to have_content("Date and Time of Event:")
        expect(page).to have_content("Duration:")
      end
    end
    it "creates a party object when the form is submitted" do
      VCR.use_cassette('create_viewing_party_path') do
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


        fill_in 'party[duration]', with: 900
        fill_in 'party[date]', with: DateTime.new(12, 12, 12)
        click_on "Create Party"

        expect(current_path).to eq(dashboard_path(user))
        expect(Party.exists?(user_id: user.id, movie_title: "Fight Club")).to eq(true)
      end
    it "creates sends an error message if a date in the future is not filled out" do
      VCR.use_cassette('create_viewing_party_path') do
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


        fill_in 'party[duration]', with: 900
        fill_in 'party[date]', with: DateTime.new(12, 12, 12)
        click_on "Create Party"

        expect(current_path).to eq(dashboard_path(user))
        expect(Party.exists?(user_id: user.id, movie_title: "Fight Club")).to eq(true)
      end
    end
  end
end
