require 'rails_helper'

RSpec.describe 'Movies Show Page' do
  before :each do
    @user = create(:mock_user)

    # allow_any_instance_of(MovieService).to receive(:request_api(path)).and_return('Cruella')
    # allow_any_instance_of(MovieInfo).to receive(:cast).and_return('Emma Stone')
    # allow_any_instance_of(MovieInfo).to receive(:reviews).and_return('Good')

    # service = MovieService.new
    # movie = service.request_api("/3/movie/#{movie_id}")
    # cast = service.request_api("/3/movie/#{movie_id}/credits")
    # reviews = service.request_api("/3/movie/#{movie_id}/reviews")

    # @movie = MovieInfo.new(movie, cast, reviews)
    # @movie = VCR.use_cassette("movie_info_by_id") do
    #   MovieFacade.movie_info_by_id(337404)
    # end

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    visit movie_path(@movie)
  end

  describe "movies attributes" do
    xit "displays that movie's attributes" do
      expect(page).to have_content(@movie.title)
      expect(page).to have_content(@movie.runtime)
      expect(page).to have_content(@movie.cast)
      expect(page).to have_content(@movie.duration)
    end
  end
end
