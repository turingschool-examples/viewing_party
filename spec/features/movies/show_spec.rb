require 'rails_helper'

RSpec.describe 'Movie Details(show) Page' do
  before :each do
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
    @movie = Film.new(details)

    visit "/movies/#{@movie.api_id}"
  end

  describe 'When I visit the movie details page' do
    it 'can see button to create a viewing party' do
      expect(page).to have_button('Create Viewing Party for Movie')
      # click_button 'Create Viewing Party for Movie'
      # expect(current_path).to eq('/viewing-party/new')
    end

    it 'can see title, rating, run time, genres, and summary for movie' do
      genres = @movie.genres

      expect(page).to have_content(@movie.title)
      expect(page).to have_content(@movie.rating)
      expect(page).to have_content(@movie.format_time(@movie.runtime))
      expect(genres.size).to eq(3)
      expect(@movie.genres).to be_an(Array)
      expect(page).to have_content(@movie.summary)
    end
  end
end
