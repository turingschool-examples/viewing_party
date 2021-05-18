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
      VCR.use_cassette('top40_movies') do
        click_button "Top 40 Movies"
        expect(current_path).to eq("/movies")
        expect(page).to have_content("Dilwale Dulhania Le Jayenge 8.7")
      end
    end

    it 'when I click link on movie title I am redirect to the movie show page' do
      click_button "Top 40 Movies"
      click_link "Dilwale Dulhania Le Jayenge"
      null = nil
      details = {
    "adult": false,
    "backdrop_path": "/gNBCvtYyGPbjPCT1k3MvJuNuXR6.jpg",
    "belongs_to_collection": null,
    "budget": 13200000,
    "genres": [
        {
            "id": 35,
            "name": "Comedy"
        },
        {
            "id": 18,
            "name": "Drama"
        },
        {
            "id": 10749,
            "name": "Romance"
        }
    ],
    "homepage": "",
    "id": 19404,
    "imdb_id": "tt0112870",
    "original_language": "hi",
    "original_title": "दिलवाले दुल्हनिया ले जायेंगे",
    "overview": "Raj is a rich, carefree, happy-go-lucky second generation NRI. Simran is the daughter of Chaudhary Baldev Singh, who in spite of being an NRI is very strict about adherence to Indian values. Simran has left for India to be married to her childhood fiancé. Raj leaves for India with a mission at his hands, to claim his lady love under the noses of her whole family. Thus begins a saga.",
    "popularity": 18.601,
    "poster_path": "/2CAL2433ZeIihfX1Hb2139CX0pW.jpg",
    "production_companies": [
        {
            "id": 1569,
            "logo_path": "/lvzN86o3jrP44DIvn4SMBLOl9PF.png",
            "name": "Yash Raj Films",
            "origin_country": "IN"
        }
    ],
    "production_countries": [
        {
            "iso_3166_1": "IN",
            "name": "India"
        }
    ],
    "release_date": "1995-10-20",
    "revenue": 100000000,
    "runtime": 190,
    "spoken_languages": [
        {
            "english_name": "Hindi",
            "iso_639_1": "hi",
            "name": "हिन्दी"
        }
    ],
    "status": "Released",
    "tagline": "Come Fall In love, All Over Again..",
    "title": "Dilwale Dulhania Le Jayenge",
    "video": false,
    "vote_average": 8.7,
    "vote_count": 2860
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
