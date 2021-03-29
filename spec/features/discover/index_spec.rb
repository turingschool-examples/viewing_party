require 'rails_helper'

RSpec.describe 'Movie Discover page' do 
  before :each do 
    @user = User.create!(email: 'person@email.com', password: '123' )
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end
  describe 'When I visit the movie Discover page' do 
    it 'I see a link to discover the top 40 movies' do
      visit discover_path 

      expect(page).to have_content("Welcome #{@user.email}")

      VCR.use_cassette('top_rated_movies') do 

        click_link "Find Top Rated Movies"

        expect(current_path).to eq(movies_path)
      end
    end
  end
end