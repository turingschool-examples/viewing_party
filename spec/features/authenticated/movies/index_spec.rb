require 'rails_helper'

RSpec.describe "Movies index page" do
  before(:each)do
    @user = User.create(email: 'test123@xyz.com', password: 'viewparty')
    visit welcome_path
    fill_in :email, with: "test123@xyz.com"
    fill_in :password, with: "viewparty"
    click_button "Sign In"
    visit movies_path
  end

  describe 'Movies Index Page' do
    it 'has a button to find top rated movies' do

      expect(page).to have_button('Find Top Rated Movies')
    end

    it 'has form to search for movies by title' do

      expect(page).to have_field('query')
      expect(page).to have_button('Find Top Rated Movies')
    end

    context "if user clicks 'Find Top Rated Movies' button" do
      it 'should return list of top rated movies and its vote average' do
        click_button 'Find Top Rated Movies'
        stub_forty_top_rated_movies
        
        expect(page).to have_content("Dilwale Dulhania Le Jayenge")
        expect(page).to have_content("8.7")
        expect(page).to have_content("The Shawshank Redemption")
        expect(page).to have_content("8.5")
        expect(current_path).to eq(movies_path)
      end
    end

    context 'if user searches for movie title with search bar' do
      it 'should list movies from search results by title and vote average' do
        fill_in("query", with: "Cruella")
        click_button("Find Movies")

        stub_search_movie_by_title

        expect(page).to_not have_content("Dilwale Dulhania Le Jayenge")
        expect(page).to_not have_content("The Shawshank Redemption")
        expect(page).to have_content("Cruella")
        expect(page).to have_content("Cruella 2")
        expect(page).to have_content("A Christmas Cruella")
        expect(page).to have_content("Mega Mindy - Della Cruella")
      end
    end

    context 'if user clicks movie title' do
      it 'should link to that movie show page' do
        expect(current_path).to eq(movies_path)
        fill_in("query", with: "Cruella")
        click_button("Find Movies")
       
        click_link "Cruella"
        expect(current_path).to eq("/movies/337404")
        expect(page).to have_content("Cruella")
        expect(page).to_not have_content("Cruella 2")
        expect(page).to have_content("Vote Average")
        expect(page).to have_content("Runtime")
        expect(page).to have_content("Genres")
        expect(page).to have_content("Cast")
      end
    end
  end
end
