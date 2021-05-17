require 'rails_helper'

RSpec.describe 'movies page' do
  context 'you want to see the top rated movies' do
    it 'there is a list of 40 movies', :vcr do
      visit discover_path
      
      click_on 'Find Top Rated Movies'
      expect(current_path).to eq(movies_path)

      expect(page).to have_link('Dilwale Dulhania Le Jayenge')
      expect(page).to have_link('Clouds')
      expect(page).to have_content('Average', count: 40)
    end
  end

  context 'you want to search for movies by title' do
    it 'returns a list of movies based on your search', :vcr do
      visit discover_path
  
      fill_in :title, with: 'Avengers'
      click_on 'Find Movies'
      expect(current_path).to eq(movies_path)
      
      expect(page).to have_link('Avengers: Endgame')
      expect(page).to have_link('Sinister Squad')
      expect(page).to have_content('Average', count: 40)
    end
  end
end