require 'rails_helper'

RSpec.describe "Movies show page" do
  before(:each)do
    @user = User.create(email: 'test123@xyz.com', password: 'viewparty')
    service = MovieService.new
    @cruella = VCR.use_cassette("movie_details_by_id") do
      MovieFacade.movie_details_by_id(337404)
    end 

    visit welcome_path
    fill_in :email, with: "test123@xyz.com"
    fill_in :password, with: "viewparty"
    click_button "Sign In"

    visit "/movies/#{@cruella.id}"
  end

  describe 'Movie Show Page' do
    it 'has a button to create a viewing party' do

      expect(page).to have_button("Create Viewing Party")
    end

    it 'shows movie title and its details' do
      
      expect(page).to have_content(@cruella.title)
      expect(page).to have_content("8.4")
      expect(page).to have_content(@cruella.runtime)
      expect(page).to have_content("Comedy")
      expect(page).to have_content("Crime")
    end

    it 'shows movie overview' do

      expect(page).to have_content(@cruella.overview)
    end

    it 'lists the first 10 members of the cast' do

      expect(page).to have_content("Emma Stone as Estella / Cruella")
      expect(page).to have_content("Kayvan Novak as Roger")
    end

    it 'lists number of reviews and review content' do

      expect(page).to have_content("Emma Stone as Estella / Cruella")
      expect(page).to have_content("Kayvan Novak as Roger")
    end
  end
end
