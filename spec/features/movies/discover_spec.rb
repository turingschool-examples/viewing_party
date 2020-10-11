require 'rails_helper'

RSpec.describe 'Discover Movies' do
  describe 'As an authenticated user' do
    describe "When I visit the discover page " do
      before :each do
        visit '/discover'
      end

      it "I see a button to discover top 40 movies" do
        expect(page).to have_button('Discover Top 40')
      end

      it "I see a search field with button to search movies by title" do
        expect(page).to have_field('keywords')
        expect(page).to have_button('Search By Movie Title')
      end

      describe "When I click the Discover Top 40 button" do
        before :each do
          click_button('Discover Top 40')
        end

        it "I am redirected to the movies page" do

          expect(current_path).to eq('/movies')
        end

        it "I click on movie title" do

          expect(page).to have_link("Gabriel's Inferno Part II")
        end

        it "I click on movie title" do
          click_link "Gabriel's Inferno Part II"

          expect(current_path).to eq("/movies/724089")
        end
      end

      describe "When I enter text in the search field" do
        describe "And click the Search By Movie Title button" do
          before :each do
            fill_in 'Keywords', with: 'the'
            click_button('Search By Movie Title')
          end

          it "I can see movie titles and vote average" do
            expect(page).to have_content("The Boys in the Band")
            expect(page).to have_content("Vote Average: 6.8")
            expect(page).to have_content("Before the Fire")
            expect(page).to have_content("Vote Average: 6.2")
          end
        end
      end
    end
  end
end

feature 'Results for top 40 movies' do
  scenario "User clicks the top 40 button", :vcr do
      visit '/discover'

      click_button('Discover Top 40')
      expect(current_path).to eq('/movies')
      expect(page).to have_content("The Green Mile")
      expect(page).to have_content("Vote Average: 8.5")
      expect(page).to have_content("Pulp Fiction")
      expect(page).to have_content("Vote Average: 8.5")
  end
end
