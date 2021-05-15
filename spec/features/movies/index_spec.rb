require 'rails_helper'

RSpec.describe 'Movies Page' do
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

  describe 'When I visit the movies page' do
    it 'can see top 40 movies titles and vote average' do
      VCR.use_cassette('top_40_movies') do
        click_button "Top 40 Movies"
        expect(current_path).to eq("/movies")
        expect(page).to have_content("Dilwale Dulhania Le Jayenge 8.7")
      end
    end

    xit 'when I click link on movie title I am redirect to the movie show page' do
      click_button "Top 40 Movies"
      click_link "Dilwale Dulhania Le Jayenge"
      details = {
        title: "Dilwale Dulhania Le Jayenge",
        rating: 8.7,
        api_id: 19404
      }
      movie = Film.new(details)
      expect(current_path).to eq("/movies/#{movie.api_id}")
    end

    it 'can see results for search by movie title' do
      VCR.use_cassette('search_dilwale') do
        fill_in "movie_title", with: "Dilwale"
        click_button "Search"
        expect(current_path).to eq("/movies")
        expect(page).to have_content("Dilwale Dulhania Le Jayenge 8.7")
      end
    end
  end
end
