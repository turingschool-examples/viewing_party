require 'rails_helper'

describe "As an authenticated user when you visit the movies page" do
  before :each do
    @user_1 = User.create!(email: 'sassy@email.com', password: 'sassyperson1')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_1)
  end

  it "shows current top 40 rated movies'" do
    # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_1)
    VCR.use_cassette('top_movie_data_movie_index') do
      visit movies_index_path

      movies = MoviesFacade.top_40

      within(".top-movies") do
        expect(page.all('a', count: 40))
        expect(movies.first.title).to appear_before(movies.second.title)
        expect(movies.first.vote_average).to be > movies.last.vote_average
      end
    end
  end

  it "shows 40 movies when I search with a keyword that has over 40 results" do
    # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_1)

    VCR.use_cassette('searched_movie_data') do
      visit movies_index_path
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

  # it "shows 40 movies when I search with a keyword that has over 40 results" do
  #   allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_1)
  #
  #   VCR.use_cassette('searched_movie_data') do
  #     visit movies_index_path
  #     save_and_open_page
  #     keyword = "fire"
  #     fill_in "find_movie", with: keyword
  #
  #     searched = FilmSearch.new.movie_searched("fire")
  #
  #     click_button("Find Movies")
  #
  #     within(".searched-movies") do
  #       expect(page.all('a', count: 40))
  #       expect(movies.first.title.include?(keyword)).to eq(true)
  #       expect(movies.last.title.include?(keyword)).to eq(true)
  #     end
  #   end
  # end
end
