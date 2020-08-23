require 'rails_helper'

RSpec.describe 'As a user, I can click a movie title' do
  describe 'and see movie details page' do
    it "contains movie reviews cast and other details" do
      OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new(
        Faker::Omniauth.google
      )
      visit root_path
      click_button 'Log In with Google'

      visit movies_path(search_terms: 'godfather')
      first('.movie > a').click
      expect(current_path).to eq('/movies/238')

      expect(page).to have_css('.movie-info')
      movie_info = find('.movie-info').text
      expect(movie_info).not_to be_empty

      within '.movie-info' do
        expect(page).to have_css('.title')
        title = find('.title').text
        expect(title).not_to be_empty

        expect(page).to have_css('.vote_average')
        vote_average = find('.vote_average').text
        expect(vote_average).not_to be_empty

        expect(page).to have_css('.runtime')
        runtime = find('.runtime').text
        expect(runtime).not_to be_empty

        expect(page).to have_css('.genres')
        genre = find('.genres').text
        expect(genre).not_to be_empty

        expect(page).to have_css('.overview')
        overview = find('.overview').text
        expect(overview).not_to be_empty
      end

      expect(page).to have_css('.cast')
      cast = find('.cast').text
      expect(cast).not_to be_empty

      within '.cast' do
          expect(page).to have_selector('.member', count: 10)
      end

      expect(page).to have_css('.reviews')
      reviews = find('.reviews').text
      expect(reviews).not_to be_empty
    end
  end
end
