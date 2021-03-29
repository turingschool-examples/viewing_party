require 'rails_helper'

RSpec.describe "Movies Show Page" do
  before :each do 
    @user = User.create(password: "hello", email: "sample@email.com")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end
  describe "When I visit the movie's detail page as a logged in user" do
    it "displays the logged in user email" do
      visit movies_path
      within "#user-info" do
        expect(page).to have_content("Welcome #{@user.email}!")
      end
    end
    it "displays top 40 rated movies if that link is clicked" do 
      visit movies_path

      VCR.use_cassette('top_rated_movies_movie_index_page') do 

        click_link "Find Top Rated Movies"

        expect(current_path).to eq(movies_path)

        @movies = MovieService.get_top_rated
        within(".movies") do 
          expect(page.all('a', count: 40))
          expect(page).to have_content(@movies.first.title)
          expect(@movies.first.title).to appear_before(@movies.second.title)
          expect(@movies.second.title).to appear_before(@movies.third.title)
        end
      end
    end
    # it "can find movies by title" do 
    #   visit movies_path
    #   VCR.use_cassette('find_movie_by_title_jack_reacher') do 

    #     fill_in "search", with: "Jack Reacher"
    #     click_button "Find Movies"

    #     expect(current_path).to eq(movies_path)

    #     @movies = MovieService.  we will put in Jordan's final method here
    #     within(".movies") do 
    #       expect(page.all('a', count: 2))
    #       expect(page).to have_content(@movies.first.title)
    #       expect(@movies.first.title).to appear_before(@movies.second.title)
    #     end
    #   end
    # end
  end
end