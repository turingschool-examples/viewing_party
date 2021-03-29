require 'rails_helper'

describe "As an authenticated user, when I visit the movies detail page I see" do
  before :each do
    @user_1 = User.create!(email: 'sassy@email.com', password: 'sassyperson1')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_1)
  end

  it "An overview with the movie name, vote average, runtime, genre(s), and summary" do
    movie = MoviesFacade.movie_info(550)

    visit movie_path(movie.id)

    within ".overview" do
      expect(page).to have_content("#{movie.title}")
      expect(page).to have_content("#{movie.vote_average}")
      expect(page).to have_content("#{movie.runtime}")
      expect(page).to have_content("#{movie.genres}")
      expect(page).to have_content("#{movie.summary}")
    end
  end

  it "A cast section with up to 10 cast members" do

  end

  it "A reviews section with a count of the reviews, each review and author" do

  end

  it "A button to create a viewing party, when clicked I am taken to a form" do

  end
end
