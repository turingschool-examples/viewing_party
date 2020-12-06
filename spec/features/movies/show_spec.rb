require 'rails_helper'

RSpec.describe 'Movies Details Page' do
  describe 'As a registered user' do
    before :each do
      @user = User.create!(email: "John@example.com", password: "password")

      visit root_path

      fill_in :email, with: @user.email
      fill_in :password, with: @user.password

      click_button("Log In")
    end

      it 'I can click a movie title to be taken to its movie details page', :vcr do
        visit discover_index_path

        fill_in "Search by movie title", with: "Gabriel's Inferno Part III"
        click_button("Find Movies")
        click_on("Gabriel's Inferno Part III")
        expect(current_path).to eq("/movies/761053")
      end

      # it 'can visit a movie details page and see a create movie viewing party and movie attributes' do
      #   visit("/movies/761053")
      #
      #   expect(page).to have_content("Gabriel's Inferno Part III")
      #   expect(page).to have_content("Vote Average: 9.2")
      #   expect(page).to have_content("9.2")
      # end
    end
   end
