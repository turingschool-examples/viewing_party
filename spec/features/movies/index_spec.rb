require 'rails_helper'

RSpec.describe "movies page" do
  before :each do
    @user = User.create!(email: "fav@email.com", username: "bestuser", password: "veryhardpassword")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  it "displays the top 20 movie titles and vote averages", :vcr do
    visit movies_path
    expect(page.all('li', count: 20))
  end

  it "display movies listed by vote average", :vcr do
    data = MoviedbService.new.get_popular_movies
    @top_20_movies = data[:results].map do |movie|
      Movie.new(movie)
    end
    expect(@top_20_movies[0].vote_average).to be >= @top_20_movies[1].vote_average
    expect(@top_20_movies[0].vote_average).to be > @top_20_movies.last.vote_average
  end
end
