require 'rails_helper'

RSpec.describe MovieProsessing do
  # describe "instance methods" do
  #   VCR.use_cassette('all_movie_info') do
  #   it "can find converted hours and minutes" do
  #     json_response = File.read('spec/fixtures/movie_details.json')
  #     body = JSON.parse(json_response)
  #     stub_request(:get, "https://api.themoviedb.org/3/movie/550?api_key=8fcfd8353e4732fe3783cb092cfaf65e&language=en-US").
  #       to_return(status: 200, body: json_response, headers: {})
  #       movie = MovieProsessing.new
  #       require "pry"; binding.pry
  #
  #       expect(MovieProsessing.convert_to_hours).to eq(2)
  #       expect(MovieProsessing.convert_to_minutes).to eq(19)
  #     end
  #   end
  # end
end
