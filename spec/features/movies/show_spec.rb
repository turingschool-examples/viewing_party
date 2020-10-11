require 'rails_helper'

RSpec.describe 'movie details page', type: :feature do
  describe 'page' do
    before :each do
      user = create :user

      visit '/'

      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password

      click_on 'Log in'
    end

    it 'can show details' do

      visit "/movies/5"

     
      expect(page).to have_button('Create Viewing Party!')
      expect(page).to have_content("#{movie.title}")
      expect(page).to have_content("#{movie.vote_average}")
      expect(page).to have_content("#{movie.runtime}")
      expect(page).to have_content("#{movie.genre}")
      expect(page).to have_content("#{movie.summary}")
      expect(page).to have_content("#{movie.cast}")
      expect(page).to have_content("#{movie.review_count}")
      expect(page).to have_content("#{movie.reviews}")
# Details: This information should come from 3 different endpoints from The Movie DB API



      expect(current_path).to eq('/movies')

      expect(@found_movies.size).to eq(40)
    end
  end
end