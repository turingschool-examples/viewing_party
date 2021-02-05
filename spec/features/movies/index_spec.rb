require 'rails_helper'

RSpec.describe 'movies index', type: :feature do
  describe 'as a user' do
    before(:each) do
      @user = create(:user, email: 'test@email.com')
      visit root_path
      click_link('Log In')
      fill_in :email, with: @user.email.upcase
      fill_in :password, with: @user.password
      click_button 'Log In'
    end

    describe 'happy path' do
      it 'i see 40 movies' do
        visit movies_path

        top_movies = MovieDbFacade.discover_films
        top_movie = top_movies.first
        last_movie = top_movies.last

        expect(page).to have_content("40 Movies")

        within("#movie-#{top_movie.id}") do
          expect(page).to have_content(top_movie.title)
          expect(page).to have_content("Vote Average: #{top_movie.vote_average}")
        end

        within("#movie-#{last_movie.id}") do
          expect(page).to have_content(last_movie.title)
          expect(page).to have_content("Vote Average: #{last_movie.vote_average}")
        end
      end

      it 'i can search by movie title' do
        visit movies_path

        within('#movie_search') do
          fill_in :search, with: 'Elf'
          click_button 'Search'
          expect(current_path).to eq(movies_path)
        end

        expect(page).to have_content("Elf")
        expect(page).to have_content("Vote Average: 1")
        expect(page).to_not have_content("Wonder Woman: 1984")
      end
    end

    describe 'sad path' do
      it 'returns top movies if search field is submitted blank' do
        visit movies_path

        fill_in :search, with: ''

        expect(current_path).to eq(movies_path)
        expect(page).to have_content('40 Movies')
      end

      it 'returns 0 movies when no matches exist' do
        visit movies_path

        fill_in :search, with: 'sdkfjaksdjf'

        expect(current_path).to eq(movies_path)
        expect(page).to have_content('0 Movies')
      end

      it 'redirects a user that is not signed in to the root path and gives a flash message' do
        visit root_path
        click_link 'Log out'
        
        visit movies_path
        
        expect(current_path).to eq(root_path)
        expect(page).to have_content('Only users may see movies!')
        save_and_open_page
      end
    end
  end
end
