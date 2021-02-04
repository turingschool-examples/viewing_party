require 'rails_helper'

RSpec.describe 'movies index', type: :feature do
  describe 'as a user' do
    it 'i see 40 movies' do
      visit movies_path
      top_movies = MovieDbFacade.discover_films(1)
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
end
