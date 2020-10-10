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

    it 'has form to search by movie title' do
      movies = MovieService.new
      @found_movies = movies.find('Hello')

      visit '/discover'

      fill_in :title, with: 'Hello'

      click_button 'Search By Title'

      expect(current_path).to eq('/movies')

      expect(@found_movies.size).to eq(40)
    end
  end
end