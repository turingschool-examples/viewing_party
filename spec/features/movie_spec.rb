require 'rails_helper'

RSpec.describe 'Movies Page' do
  let(:user) { create(:user) }
  stub_request(:any, 'https://api.themoviedb.org').
    to_return(:body => %Q(
      {
        title: "Jack Reacher",
        vote_average: 6.5
      },
      {
        title: "Jack be Nimble",
        vote_average: 5.0
      }
    ))
  # cookies.encrypted[:user_id] = user.id
  describe 'location' do
    it 'can be reached from the dashboard' do
      VCR.use_cassette 'imdb_top' do
      
        visit '/dashboard'

        expect(page).to have_link('Discover Movies')

        click_on 'Discover Movies'

        expect(page).to have_current_path('/discover')
        expect(page).to have_button('Discover top 40 movies')

        click_on 'Discover top 40 movies'
        require 'pry', binding.pry

        expect(page).to have_current_path('/movies')
        expect(page).to have_content('Luca')
      end
    end
  end
  describe 'Searching for a movie' do
    it 'returns a list of movies' do
      visit '/discover'

      fill_in :movie_title, with: 'Jack'
      click_on 'Find Top Rated Movies'

      expect(page)
      expect(page).to have_field('search_title')

      expect(page).to have_current_path('/movies')
      expect(page).to have_link('Jack Ryan')
      expect(page).to have_content('6.5')
      expect(page).to have_link('Jack be Nimble')
      expect(page).to have_content('5.0')

      click_on 'Jack Ryan'

      expect(page).to have_current_path('/movies/details')
    end
  end
end