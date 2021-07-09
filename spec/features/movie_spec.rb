require 'rails_helper'

RSpec.describe 'Movies Page' do
  let(:user) { create(:user) }
  describe 'location' do
    it 'can be reached from the dashboard' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      VCR.use_cassette 'imdb_top' do
      
        visit '/dashboard'

        expect(page).to have_button(value='Discover Top 40 Movies')

        click_on 'Discover Top 40 Movies'

        expect(page).to have_current_path("/discover", ignore_query: true)
        expect(page).to have_button('Find Top Rated Movies')
        expect(page).to have_content('Luca')
      end
    end
  end
  describe 'Searching for a movie' do
    it 'returns a list of movies' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      VCR.use_cassette 'imdb_top' do

        visit '/discover'

      end
      VCR.use_cassette 'imdb_search' do

        fill_in :movie_title, with: 'Jack'
        click_on 'Find Top Rated Movies'

        expect(page).to have_button('Find Top Rated Movies')
        expect(page).to have_field('movie_title')

        expect(page).to have_current_path('/movies', ignore_query: true)
        expect(page).to have_link('Jack Ryan')
        expect(page).to have_content('6.5')
        expect(page).to have_link('Jack and Jill')
        expect(page).to have_content('4.3')

        click_on 'Jack Ryan'

        expect(page).to have_current_path('/movies/details', ignore_query: true)
        expect(page).to have_content('Jack Ryan')
      end
    end
  end
end