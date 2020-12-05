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

      it 'I see a button to create a viewing party', :vcr do
        # movie_1 = File.read('spec/fixtures/movies_search.json')
        # stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=3f3f1b6bf5a188108490867c4c43f1e4&include_adult=false&language=en-US&page=1&query=Gabriel's%20Inferno%20Part%20III").with(
        #   headers: {
        #   'Accept'=>'*/*',
        #   'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        #   'User-Agent'=>'Faraday v1.1.0'
        #   }).to_return(status: 200, body: movie_1, headers: {})


        # movie _1 = VCR.use_cassette('movies_search') do


        visit discover_index_path

        fill_in "Search by movie title", with: "Gabriel's Inferno Part III"
        click_button("Find Movies")
        click_on("Gabriel's Inferno Part III")
        expect(current_path).to eq("/movies/#{movie_1[:id]}")

        end
      end
    end
