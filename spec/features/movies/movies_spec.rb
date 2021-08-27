require 'rails_helper'

RSpec.describe 'movie page' do
  describe 'contents' do
    it 'can display top 40 movies' do
      json_response1 = File.read('spec/fixtures/popular_movies1.json')

      stub_request(:get, "https://api.themoviedb.org/3/movie/popular?api_key&page=1").
      with(
        headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v1.7.0'
          }).
          to_return(status: 200, body: json_response1, headers: {})

          json_response2 = File.read('spec/fixtures/popular_movies2.json')

          stub_request(:get, "https://api.themoviedb.org/3/movie/popular?api_key&page=2").
          with(
            headers: {
              'Accept'=>'*/*',
              'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
              'User-Agent'=>'Faraday v1.7.0'
              }).
              to_return(status: 200, body: json_response2, headers: {})

              visit '/discover'

              click_on "Find Top Rated Movies"

              expect(page).to have_css('.movie', count: 40)

              within(first('.movie')) do
                expect(page).to have_css('.title')
                expect(page).to have_css('.rating')
              end
            end
          end
        end
