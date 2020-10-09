require 'rails_helper'

RSpec.describe 'movie show page' do
  before(:each) do
    @user = User.create!(username: "eDog", email: "elah@email.com", password: "password")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  describe 'As an authenticated user' do
    describe "When I visit the movies detail page," do
      describe "I should see a button 'create a viewing party'" do
        it "and if I click this button it takes me to a new event page" do
          json1 = File.read('spec/fixtures/top_40_movies_1.json')
          json2 = File.read('spec/fixtures/top_40_movies_2.json')

          stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['MOVIE_API_KEY']}&language=en-US&page=1").to_return(status: 200, body: json1)
          stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['MOVIE_API_KEY']}&language=en-US&page=2").to_return(status: 200, body: json2)
          visit "/discover"
          click_button "Discover Top 40 Movies"

          within(first(".movie")) do
            click_link
          end
          expect(current_path).to eq("/party#{@user.id}/new")
        end
      end
    end
  end
end
