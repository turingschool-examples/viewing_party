require 'rails_helper'

 RSpec.describe 'user like button' do
   describe 'functionality' do
     it 'can like a movie by clicking the like button' do
       json_response = File.read('spec/fixtures/movie_cast.json')

       stub_request(:get, "https://api.themoviedb.org/3/movie/550/credits?api_key=#{ENV['movie_key']}").
            with(
              headers: {
          	  'Accept'=>'*/*',
          	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          	  'User-Agent'=>'Faraday v1.7.0'
              }).
            to_return(status: 200, body: json_response, headers: {})

    json_response2 = File.read('spec/fixtures/movie_postman.json')

    stub_request(:get, "https://api.themoviedb.org/3/movie/550?api_key=#{ENV['movie_key']}").
    with(
      headers: {
     'Accept'=>'*/*',
     'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
     'User-Agent'=>'Faraday v1.7.0'
      }).
    to_return(status: 200, body: json_response2, headers: {})

    json_response3 = File.read('spec/fixtures/movie_reviews.json')

    stub_request(:get, "https://api.themoviedb.org/3/movie/550/reviews?api_key=6fb7f4e0ab0ae38d119bf702769de95d").
        with(
          headers: {
         'Accept'=>'*/*',
         'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
         'User-Agent'=>'Faraday v1.7.0'
          }).
        to_return(status: 200, body: json_response3, headers: {})

       user = create(:user)

       allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

       visit '/movies/550'

       within("#likes") do
         find(:css, '.icon').click
       end

       expect(current_path).to eq('/movies/550')

       within(".button_badge") do
         expect(page).to have_content('1')
       end

       within(".dropdown-menu") do
         expect(page).to have_button('Fight Club')

         click_on 'Fight Club'
       end

       expect(current_path).to eq(viewing_parties_new_path)
     end

     it 'can only like a movie once' do
       json_response = File.read('spec/fixtures/movie_cast.json')

       stub_request(:get, "https://api.themoviedb.org/3/movie/550/credits?api_key=#{ENV['movie_key']}").
            with(
              headers: {
             'Accept'=>'*/*',
             'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
             'User-Agent'=>'Faraday v1.7.0'
              }).
            to_return(status: 200, body: json_response, headers: {})

    json_response2 = File.read('spec/fixtures/movie_postman.json')

    stub_request(:get, "https://api.themoviedb.org/3/movie/550?api_key=#{ENV['movie_key']}").
    with(
      headers: {
     'Accept'=>'*/*',
     'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
     'User-Agent'=>'Faraday v1.7.0'
      }).
    to_return(status: 200, body: json_response2, headers: {})

    json_response3 = File.read('spec/fixtures/movie_reviews.json')

    stub_request(:get, "https://api.themoviedb.org/3/movie/550/reviews?api_key=6fb7f4e0ab0ae38d119bf702769de95d").
        with(
          headers: {
         'Accept'=>'*/*',
         'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
         'User-Agent'=>'Faraday v1.7.0'
          }).
        to_return(status: 200, body: json_response3, headers: {})

       user = create(:user)

       allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

       visit '/movies/550'

       within("#likes") do
         find(:css, '.icon').click
         find(:css, '.icon').click
         find(:css, '.icon').click
       end

       expect(current_path).to eq('/movies/550')

       within(".button_badge") do
         expect(page).to have_content('1')
       end

       within(".dropdown-menu") do
         expect(page).to have_button('Fight Club', count: 1)
       end
     end
   end
 end
