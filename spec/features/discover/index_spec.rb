require 'rails_helper'

RSpec.describe "Discover Page" do
  describe "Top rated movies and search by title" do
    before :each do
      @user_2 = User.create!(email: 'empanada_luvr@email.com', password: 'hocuspocus')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_2)
      visit discover_path
    end

    it 'displays button to find top rated 40 movies' do
      expect(page).to have_button('Find Top Rated Movies')

      click_on "Find Top Rated Movies"

      expect(current_path).to eq(movies_path)
      # expect(page).to have_content("movie title") put one of the top 40 movie titles here
    end

    it 'allows user to search by title with a max of 40 matches' do
      expect(page).to have_content('Search by Movie Title')

      fill_in :movie_title, with: 'Shawshank Redemption'

      click_button('Find Movies')

      expect(current_path).to eq(movies_path) #may put fist and last movies
    end
  end
end
