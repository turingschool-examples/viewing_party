require 'rails_helper'

RSpec.describe "Discover Page" do
  describe "Top rated movies and search by title" do
    before :each do
      @user_2 = User.create!(email: 'empanada_luvr@email.com', password: 'hocuspocus')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_2)
      visit movie_path
    end
  end
end
# When I visit the movies page,
# I should see the 40 results from my search,
# I should also see the "Find Top Rated Movies" button and the Find Movies
# form at the top of the page.
#
# Details: The results from the search should appear on this page, and there
# should only be a maximum of 40 results. The following details should be listed
# for each movie.
#
#  Title (As a Link to the Movie Details page)
#  Vote Average of the movie
