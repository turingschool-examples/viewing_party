require 'rails_helper'

RSpec.describe 'Discover Movies' do
  describe 'As an authenticated user' do
    describe "When I visit the discover page " do
      before :each do
        @movie_1 = Movie.create(title: "Whatever Works", vote_average: 7.1, movie_db_id: 16222)
        # require "pry"; binding.pry
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
          expect(page).to have_link(@movie_1.title)
        end

        it "I click on movie title" do
          click_link @movie_1.title

          expect(current_path).to eq("/movies/#{@movie_1.id}")
        end
      end

      describe "When I enter text in the search field" do
        describe "And click the Search By Movie Title button" do
          before :each do
            fill_in 'Keywords', with: 'the'
            click_button('Search By Movie Title')
          end

          it "I am redirected to the movies page" do
            expect(current_path).to eq('/movies')
          end

          it "I can see movie titles and vote average" do
            expect(page).to have_content("The Boys in the Band")
            expect(page).to have_content("Vote Average: 6.8")
            expect(page).to have_content("Before the Fire")
            expect(page).to have_content("Vote Average: 6.2")
          end

          it "I can see 41 movie_info classes, because of the extra one that's been added at the top of the test" do
            expect(page).to have_css('ul', :count => 41)
          end
        end
      end

      describe "When I do not enter any text in the search field" do
        describe "And click the Search By Movie Title button" do
          it "I am shown the top 40 movies" do

            click_button('Search By Movie Title')
            expect(current_path).to eq('/movies')
            expect(page).to have_content("The Green Mile")
            expect(page).to have_content("Vote Average: 8.5")
            expect(page).to have_content("Pulp Fiction")
            expect(page).to have_content("Vote Average: 8.5")
          end
        end
      end
    end
  end
end
