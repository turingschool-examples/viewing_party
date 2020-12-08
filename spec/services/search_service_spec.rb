require 'rails_helper'

describe SearchService do
  context "instance methods" do
    context "#search_results" do
      it "returns movie data" do
        search = SearchService.search_results("The Godfather")
        expect(search).to be_a Hash
        expect(search[:results]).to be_an Array
        movie_data = search[:results].first

        expect(movie_data).to have_key :original_title
        expect(movie_data[:original_title]).to be_a(String)

        expect(movie_data).to have_key :vote_average
        expect(movie_data[:vote_average]).to be_a(Float)
      end
    end
  end
end
