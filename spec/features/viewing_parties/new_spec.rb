require 'rails_helper'
RSpec.describe 'it can make a view party form' do
  before :each do

    @movie = Movie.new({original_title: 'Fight Club',
      overview: "A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy.",
      vote_average: '8.4',
      genres: ["Drama"],
      cast: [{name: "Edward Norton", character: "The Narrator"}, {name: "Brad Pitt", character: "Tyler Durden"}],
      reviews: [{author: "Goddard", review: "Pretty awesome movie.  It shows what one crazy person can convince other crazy people to do.  Everyone needs something to believe in.  I recommend Jesus Christ, but they want Tyler Durden."}, {author: "Brett Pascoe", review: "In my top 5 of all time favourite movies. Great story line and a movie you can watch over and over again."}],
      id: '550',
      genres: ['Drama'],
      runtime: '139'})

      allow_any_instance_of(MovieFacade).to receive(:create_movie).and_return(@movie)

      visit "/movies/#{@movie.id}"
    end

    it 'can visit a viewing party form' do
      user = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      json_response = File.read('spec/fixtures/search_movie.json')

      stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['movie_key']}&include_adult=false&page=1&query=fight%20club").
      with(
        headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v1.7.0'
          }).
          to_return(status: 200, body: json_response, headers: {})

          # movies = MovieService.new.movie_search('fight club')

          # visit '/discover'
          #
          # fill_in :search, with: "fight club"
          # click_on "Search Movies!"
          #
          # within(first('.movies-search')) do
          #   click_on "Fight Club"
          # end
          click_on 'Create a Viewing Party for Movie'

          expect(current_path).to eq("/viewing-parties/new")
          # expect(session[:user_id]).to eq(user.id)

          expect(page).to have_field(:title)
          # expect(page).to have_field(:duration, placeholder: @movie.runtime)
          expect(page).to have_field(:date)
          expect(page).to have_field(:time)
          # expect(page).to have_field(:friend, count: 2)
          expect(page).to have_button("Create Party")
          expect(page).to have_content("The Suicide Squad")
        end

        it 'user can fill out form to create a viewing party' do
          user1 = create(:user)
          user2 = create(:user)
          user3 = create(:user)
          Friendship.create!(user: user1, friend: user2)
          Friendship.create!(user: user1, friend: user3)

          allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)

          json_response = File.read('spec/fixtures/search_movie.json')

          stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['movie_key']}&include_adult=false&page=1&query=fight%20club").
          with(
            headers: {
              'Accept'=>'*/*',
              'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
              'User-Agent'=>'Faraday v1.7.0'
              }).
              to_return(status: 200, body: json_response, headers: {})

              click_on 'Create a Viewing Party for Movie'

              fill_in :date, with: "20/9/2021"
              fill_in :time, with: "9:00am"
              check "#{user2.id}"

              click_on 'Create Party'

              viewing_party = WatchParty.last

              expect(current_path).to eq('/dashboard')
              expect(viewing_party.duration).to eq('139')
              expect(viewing_party.movie).to eq('Fight Club')
              expect(viewing_party.genre).to eq(['Drama'])
              expect(viewing_party.host_id).to eq(user1.id)
              expect(viewing_party.date).to eq("20/9/2021")

              within("#party-#{viewing_party.id}") do
                expect(page).to have_content(viewing_party.title)
                expect(page).to have_content(viewing_party.date)
                expect(page).to have_content('Hosting')
              end
            end
          end
