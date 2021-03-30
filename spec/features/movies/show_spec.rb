require 'rails_helper'

describe "As an authenticated user, when I visit the movies detail page I see" do
  before :each do
    @user_1 = User.create!(email: 'sassy@email.com', password: 'sassyperson1')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_1)
  end

  it "An overview with the movie name, vote average, runtime, genre(s), and summary" do
    VCR.use_cassette('top_movie_data_movie_index') do
      @movies = MoviesFacade.top40
    end
    movie = @movies.third

    VCR.use_cassette('single_movie_show_page') do
      visit movie_path(movie.id)

      @movie = MoviesFacade.movie_info(movie.id)

      within ".overview" do
        expect(page).to have_content("#{@movie.title}")
        expect(page).to have_content("#{@movie.vote_average}")
        expect(page).to have_content("#{@movie.runtime_hours_mins}")
        expect(page).to have_content("#{@movie.genre_names}")
        expect(page).to have_content("#{@movie.summary}")
      end
    end
  end

  it "A cast section with up to 10 cast members" do

  end

  it "A reviews section with a count of the reviews, each review and author" do

  end

  it "A button to create a viewing party, when clicked I am taken to a form" do

  end
end
