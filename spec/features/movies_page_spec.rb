require 'rails_helper'

RSpec.describe 'Movies Page', type: :feature do
  before :each do
    user = User.create!(email: "ClaSte@hotmail.com", password: "1234", password_confirmation: "1234" )
    login(user)
  end

  describe 'Top 40 movies' do
    it "Displays the top 40 highest rated movies" do
      visit movies_path

      expect(page).to have_content("Top 40 Movies")

      # expect(MovieService.get_top_rated_movies.first[:id]).to eq(19404)

      within(".movies") do
        expect(page).to have_content("दिलवाले दुल्हनिया ले जायेंगे, Vote Average: 8.7")
        expect(page).to have_content("Gabriel's Inferno Part II, Vote Average: 8.7")
        expect(page).to have_content("The Shawshank Redemption, Vote Average: 8.7")
        expect(page).to have_content("Fight Club, Vote Average: 8.4")
        expect(page).to have_content("Clouds, Vote Average: 8.4")
        expect(page).to have_content("Cidade de Deus, Vote Average: 8.4")
        # expect(page).to have_content(MovieService.get_top_rated_movies.size == 40)
      end
    end

    it 'shows a link on the movie title to go to the show page' do
      visit movies_path

      within("#movie-#{MovieService.get_top_rated_movies.first[:id]}") do
        expect(page).to have_link("दिलवाले दुल्हनिया ले जायेंग")
        click_link "दिलवाले दुल्हनिया ले जायेंग"
        expect(current_path).to eq("/movies/19404")
      end
    end
  end
end
