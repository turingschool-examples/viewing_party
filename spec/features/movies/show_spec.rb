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

        fill_in "Search by movie title", with: "The Godfather: Part II"
        click_button("Find Movies")
        click_on("The Godfather: Part II")
        expect(current_path).to eq("/movies/240")
      end

      it 'can visit a movie details page and see a create movie viewing party and movie attributes', :vcr do
        visit("/movies/238")

        expect(page).to have_button("Create Viewing Party for Movie")

        expect(page).to have_content("The Godfather")
        expect(page).to have_content("Vote Average: 8.7")
        expect(page).to have_content("Runtime: 2 hr 55 mins")

        within '.genre' do
          expect(page).to have_content("Genre(s):")
          expect(page).to have_content("Drama")
          expect(page).to have_content("Crime")
          expect(page).to_not have_content("Comedy")
        end

        within '.summary' do
          expect(page).to have_content("Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family.")
        end

        within '.cast' do
          expect(page).to have_content("Al Lettieri as Virgil 'The Turk' Sollozzo")
        end

        within '.reviews' do
          expect(page).to have_content("Virtually everyone recognizes that iconic trumpet solo")
          expect(page).to have_content("Author: futuretv")
          expect(page).to have_content("1 Review(s)")
        end

        within '.similar' do
          expect(page).to have_link("The Godfather: Part II")
          expect(page).to have_content("1974-12-20")
        end
      end
    end
   end
