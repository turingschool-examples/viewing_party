require 'rails_helper'

describe 'methods' do

  it ".conn" do
    api_response = MovieApiService.conn.get("/3/movie/top_rated")
    expect(api_response.status).to eq(200)
  end

  it ".parse_data" do
    api_response = MovieApiService.conn.get("/3/movie/top_rated")
    expect(MovieApiService.parse_data(api_response).class).to eq(Hash)
  end

  it ".top_rated_movies" do
    expect(MovieApiService.top_rated_movies.class).to eq(Array)
    expect(MovieApiService.top_rated_movies.count).to eq(40)
  end
end
