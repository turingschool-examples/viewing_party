require 'rails_helper'

describe "As an authenticated user, when I visit the movies detail page I see" do
  before :each do
    @user_1 = User.create!(email: 'sassy@email.com', password: 'sassyperson1')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_1)
  end

  before :all do
    # VCR.use_cassette('top_movie_data_movie_show') do
      # @movies = FilmSearch.new
    # end
  end

  it "An overview with the movie name, vote average, runtime, genre(s)" do
    # visit movie_path(550)

    # expect
  end

  it "A details section with a movie summary and up to 10 cast members" do

  end

  it "A reviews section with a count of the reviews, each review and author" do

  end

  it "A button to create a viewing party, when clicked I am taken to a form" do

  end
end
