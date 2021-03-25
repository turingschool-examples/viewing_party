require 'rails_helper'

RSpec.describe 'Movie Show Page' do
  describe '' do
    it '' do

      json_response = File.read('spec/fixtures/movie_details.json')
      json_cast_response = File.read('spec/fixtures/cast_details.json')
      json_review_response = File.read('spec/fixtures/review_details.json')
      body = JSON.parse(json_response)
      cast_body = JSON.parse(json_cast_response)
      review_body = JSON.parse(json_review_response)
        stub_request(:get, "https://api.themoviedb.org/3/movie/550?api_key=8fcfd8353e4732fe3783cb092cfaf65e&language=en-US").
          to_return(status: 200, body: json_response, headers: {})
          stub_request(:get, "https://api.themoviedb.org/3/movie/550/credits?api_key=8fcfd8353e4732fe3783cb092cfaf65e&language=en-US").
      to_return(status: 200, body: json_cast_response, headers: {})
      stub_request(:get, "https://api.themoviedb.org/3/movie/550/reviews?api_key=8fcfd8353e4732fe3783cb092cfaf65e&language=en-US&page=1").
         to_return(status: 200, body: json_review_response, headers: {})

      visit("/movies/550")

      expect(page).to have_button("Create Viewing Party for Movie")
      expect(page).to have_content(body["title"])
      expect(page).to have_content(body["genres"][0]["name"])
      expect(page).to have_content(body["runtime"])
      expect(page).to have_content(body["vote_average"])
      expect(page).to have_content(body["overview"])
       expect(page).to have_content("Edward Norton")
       expect(page).to have_content("Brad Pitt")
       expect(page).to have_content("Goddard")
       expect(page).to have_content("Brett Pascoe")
       expect(page).to have_content("msbreviews")
       expect(page).to have_content(review_body["results"].count)
    end
  end
end
