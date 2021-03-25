require 'rails_helper'

RSpec.describe 'Movie Show Page' do
  describe '' do
    it '' do

      json_response = File.read('spec/fixtures/movie_details.json')
      body = JSON.parse(json_response)
      stub_request(:get, "https://api.themoviedb.org/3/movie/550?api_key=8fcfd8353e4732fe3783cb092cfaf65e&language=en-US").
      to_return(status: 200, body: json_response, headers: {})

      visit("/movies/550")

      expect(page).to have_button("Create Viewing Party for Movie")
      expect(page).to have_content(body["title"])
      expect(page).to have_content(@movie.genres)
      expect(page).to have_content(@movie.runtime)
      expect(page).to have_content(@movie.vote_average)
      expect(page).to have_content(@movie.overview)
      # expect(page).to have_content(@movie.cast)
      # expect(page).to have_content(@movie.reviews)
      # expect(page).to have_content(@movie.reviews.count)
    end
  end
end
