require 'rails_helper'

RSpec.describe 'discover', type: :feature do
  describe 'page' do
    before :each do
      user = create :user

      visit '/'

      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password

      click_on 'Log in'
    end

      it 'has button to discover top 40 movies' do
        VCR.use_cassette('top_40_movies') do
          @movies = MovieService.find_top_40
          visit '/discover'
          expect(page).to have_button('Top 40 Movies')

          click_button 'Top 40 Movies'

          expect(current_path).to eq('/movies')
          expect(page).to have_content("Gabriel's Inferno Part II")
          expect(page).to have_content("8.9")
          expect(@movies.size).to eq(40)
        end
      end
        
      it 'has form to search by movie title' do
        VCR.use_cassette('happy_movie_search') do
          @movies = MovieService.find_title('Hello')
     
          visit '/discover'

          fill_in :title, with: 'Hello'

          click_button 'Search By Title'

          expect(current_path).to eq('/movies')
          expect(@movies.size).to eq(40)
        end
      end
      it 'returns notice if no movies found' do
        VCR.use_cassette('sad_movie_search') do
          
          visit '/discover'
          fill_in :title, with: ''

          click_button 'Search By Title'
          expect(current_path).to eq('/discover')

          expect(page).to have_content('Please enter a title')
          
          fill_in :title, with: 'asdf'
          click_button 'Search By Title'
          expect(page).to have_content('Sorry, no movies were found.')
        end
      end
  end
end
