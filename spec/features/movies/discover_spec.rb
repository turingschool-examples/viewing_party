require 'rails_helper'

RSpec.describe 'Discover Movies' do
  describe 'As a visitor' do
    describe "When I visit the discover page" do
      it "I can see a message telling me to login to see this page" do
        visit '/discover'
        expect(page).to have_content("This Page Only Accessible by Authenticated Users. Please Log In.")
        expect(current_path).to eq(root_path)
      end
    end
  end

  describe 'As an authenticated user' do
    describe "When I visit the discover page" do
      before :each do
        @user_1 = User.create(name: 'Jackie Chan', email: 'a@a.com', password: 'a', password_confirmation: 'a')
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_1)
        visit '/discover'
      end

      it "I see a button to discover top 40 movies" do
        expect(page).to have_button('Discover Top 40')
      end

      it "I see a search field with button to search movies by title" do
        expect(page).to have_field('keywords')
        expect(page).to have_button('Search By Movie Title')
      end
    end
  end
end

      # describe "When I click the Discover Top 40 button" do
      #   before :each do
      #     click_button('Discover Top 40')
      #   end
      #
      #   it "I am redirected to the movies page" do
      #
      #     expect(current_path).to eq('/movies')
      #   end
      #
      #   it "I click on movie title" do
      #
      #     expect(page).to have_link("The Shawshank Redemption")
      #   end
      #
      #   it "I click on movie title" do
      #     click_link "The Shawshank Redemption"
      #
      #     expect(current_path).to eq("/movies/278")
      #   end
      # end

#       describe "When I enter text in the search field" do
#         describe "And click the Search By Movie Title button" do
#           before :each do
#             fill_in 'Keywords', with: 'the'
#             click_button('Search By Movie Title')
#           end
#
#           it "I am redirected to the movies page" do
#             expect(current_path).to eq('/movies')
#           end
#
#           it "I can see movie titles and vote average" do
#             expect(page).to have_content("The Boys in the Band")
#             expect(page).to have_content("Vote Average: 6.8")
#             expect(page).to have_content("Before the Fire")
#             expect(page).to have_content("Vote Average: 6.2")
#           end
#
#           it "I can see 40 movie_info classes" do
#             expect(page).to have_css('ul', :count => 40)
#           end
#         end
#       end
#     end
#   end
# end


feature 'Results for top 40 movies' do
  before :each do
    @user_1 = User.create(name: 'Jackie Chan', email: 'a@a.com', password: 'a', password_confirmation: 'a')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_1)
    visit '/discover'
  end
  scenario "User clicks the top 40 button", :vcr do
      click_button('Discover Top 40')
      expect(current_path).to eq('/movies')
      expect(page).to have_content("The Green Mile")
      expect(page).to have_content("Vote Average: 8.5")
      expect(page).to have_content("Pulp Fiction")
      expect(page).to have_content("Vote Average: 8.5")
  end
end
