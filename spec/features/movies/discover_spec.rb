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
        it "I am redirected to the movies page" do

          click_button('Discover Top 40')
          expect(current_path).to eq('/movies')
        end
      end

      describe "When I enter text in the search field" do
        describe "And click the Search By Movie Title button" do
          it "I am redirected to the movies page" do

            fill_in 'Keywords', with: 'whatever'
            click_button('Search By Movie Title')
            expect(current_path).to eq('/movies')
          end
        end
      end

      describe "When I do not enter any text in the search field" do
        describe "And click the Search By Movie Title button" do
          xit "I see an error message indicating I must enter text" do

            click_button('Search By Movie Title')
            expect(current_path).to eq('/discover')
            expect(page).to have_content('Must enter text to search')
          end
        end
      end
    end
  end
end
