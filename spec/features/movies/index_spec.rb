require 'rails_helper'

describe "As an authenticated user when you visit the movies page" do
  before :each do
    @user_1 = User.create!(email: 'sassy@email.com', password: 'sassyperson1')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_1)
  end

  it "shows current top 40 rated movies'" do
    VCR.use_cassette('top_movie_data_movie_index') do
      visit movies_path

      movies = MoviesFacade.top40

      within(".top-movies") do
        expect(page.all('a', count: 40))
        expect(movies.first.title).to appear_before(movies.second.title)
        expect(movies.first.vote_average).to be > movies.last.vote_average
      end
    end
  end

  it "shows 40 movies when I search with a keyword that has over 40 results" do
    VCR.use_cassette('searched_movie_data') do
      visit movies_path
      keyword = "fire"
      fill_in "find_movie", with: keyword

      movies = MoviesFacade.movie_search(keyword)

      click_button("Find Movies")

      within(".top-movies") do
        expect(page.all('a', count: 40))
        expect(movies.first.title.downcase.include?(keyword)).to eq(true)
        expect(movies.last.title.downcase.include?(keyword)).to eq(true)
      end
    end
  end

  it "shows 0 movies and a flash message pops up when a bad keyword is given" do
    VCR.use_cassette('searched_movie_bad_keyword') do
      visit movies_path
      keyword = "asdkajshdjkhasd"
      fill_in "find_movie", with: keyword

      movies = MoviesFacade.movie_search(keyword)

      click_button("Find Movies")

      within(".top-movies") do
        expect(page.all('a', count: 0))
        expect(movies.empty?).to eq(true)
      end

      expect(page).to have_content("Your search returned 0 results")
    end
  end

  it "shows under 40 results when the keyword is more specific" do
    VCR.use_cassette('searched_movie_pulp_fiction') do
      visit movies_path
      keyword = "pulp fiction"
      fill_in "find_movie", with: keyword

      movies = MoviesFacade.movie_search(keyword)

      click_button("Find Movies")

      within(".top-movies") do
        expect(page.all('a', count: 6))
        expect(movies.first.title.downcase.include?(keyword)).to eq(true)
        expect(movies.last.title.downcase.include?(keyword)).to eq(true)
      end
    end
  end

  it "shows top 40 movies when the keyword is left blank" do
    VCR.use_cassette('searched_movie_blank_keyword') do
      visit movies_path
      keyword = ""
      fill_in "find_movie", with: keyword

      movies = MoviesFacade.top40

      click_button("Find Movies")

      within(".top-movies") do
        expect(page.all('a', count: 40))
        expect(movies.first.title).to appear_before(movies.second.title)
        expect(movies.first.vote_average).to be > movies.last.vote_average
      end
    end
  end
end
