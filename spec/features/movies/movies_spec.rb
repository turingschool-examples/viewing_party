require 'rails_helper'

RSpec.describe 'movie page' do
  describe 'contents' do
    it 'can display top 40 movies' do
      visit '/discover'

      click_on "Find Top Rated Movies"

      # expect(current_path).to eq('/movies')

      expect(page).to have_css('.movie', count: 40)

      within(first('.movie')) do
        expect(page).to have_css('.title')
        expect(page).to have_css('.rating')
      end
    end

    it 'can display movies from a user search' do
      movies = MovieService.new.movie_search('fight club')

      visit '/discover'

      fill_in :search, with: "fight club"
      click_on "Search Movies!"

      expect(page).to have_css('.movies_search')

      within(first('.movies_search')) do
        expect(page).to have_css('.title_search')
        expect(page).to have_button(movies[0][:original_title])
        expect(page).to have_css('.rating_search')
        expect(page).to have_content(movies[0][:vote_average])
      end
    end
  end
end
