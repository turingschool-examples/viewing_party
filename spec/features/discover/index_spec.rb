require 'rails_helper'

RSpec.describe 'Discover Page' do
  before :each do
    visit '/login'
    email = "example@example.com"
    password = "test"
    user = User.create!(email: email, password: password)

    fill_in :email, with: email
    fill_in :password, with: password
    click_button "Log In"
    click_button "Discover Movies"
  end

  describe 'I visit the discover page' do
    it 'can see button to top 40 movies' do
      expect(page).to have_button("Top 40 Movies")
      click_button "Top 40 Movies"
      expect(current_path).to eq('/movies')
    end

    it 'can see text field to search for movie by name' do
      expect(page).to have_field(:movie_title)
      expect(page).to have_button("Search")
      fill_in :movie_title, with: "Hello World"
      click_button "Search"
      expect(current_path).to eq('/movies')
    end

    it 'can see results for 10 upcoming movies' do
      VCR.use_cassette('ten_upcoming_movies') do

        click_link "10 Upcoming Movies"
        expect(page).to have_content("Godzilla vs. Kong")
        expect(page).to have_content("2021-03-24")
      end
    end
  end

  describe 'sad paths and edge cases' do
    it 'shows message if search field is blank' do
      fill_in :movie_title, with: ""
      click_button "Search"
      expect(page).to have_content("Search field cannot be blank.")
    end
  end
end
