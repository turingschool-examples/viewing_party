require 'rails_helper'

RSpec.describe 'Discover Movies Index page' do
  before(:each) do
    user = User.create(user_name: 'joeyh@test.com', password: 'doyouwanttohearasong')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end
  describe 'when a logged in user visits the discover movies path' do
    it 'displays a button to discover top 40 movies, and a form to search movies by title', :vcr do
      visit discover_movies_path
      expect(current_path).to eq('/discover/movies')
      expect(page).to have_content('Movies')
      expect(page).to have_button('Discover Top 40 Movies')
      expect(page).to have_content('Search For Movies')
      expect(page).to have_field(:search)
    end

    it 'user can search for a movie by title', :vcr do
      visit discover_movies_path
      fill_in :search, with: 'Mortal Kombat'
      click_button 'Search'
      expect(current_path).to eq('/discover/movies')
      expect(page).to have_content('Mortal Kombat')
      click_link "Mortal Kombat Legends: Scorpion's Revenge"
      expect(current_path).to eq('/discover/movies/664767')
    end
    it 'user can search for a movie and only see 40 results at most', :vcr do
      visit discover_movies_path
      fill_in :search, with: 'A'
      click_button 'Search'
      expect(current_path).to eq('/discover/movies')
      expect(page).to have_css('.movie', count: 40)
    end
    it 'load the movies discover movies page with top 40 when selected', :vcr do
      visit discover_movies_path
      click_button 'Discover Top 40 Movies'
      expect(current_path).to eq('/discover/movies')
      expect(page).to have_css('.movie', count: 40)
      click_link 'Mortal Kombat'
      expect(current_path).to eq('/discover/movies/460465')
    end
    it 'displays similar movies to what was selected in the show', :vcr do
      visit discover_movies_path
      click_button 'Discover Top 40 Movies'
      click_link 'Mortal Kombat'
      click_button 'Similar Movies'
      expect(page).to have_content('Movies Similar to Mortal Kombat')
      expect(current_path).to eq(discover_movies_path)
      expect(page).to have_css('.movie', count: 5)
    end
  end
end
