require 'rails_helper'

RSpec.describe WatchPartyMailer do
  describe 'watch party creation' do
    before(:each) do
      @movie = Movie.new({original_title: 'Fight Club',
        overview: "A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy.",
        vote_average: '8.4',
        genres: ["Drama"],
        cast: [{name: "Edward Norton", character: "The Narrator"}, {name: "Brad Pitt", character: "Tyler Durden"}],
        reviews: [{author: "Goddard", review: "Pretty awesome movie.  It shows what one crazy person can convince other crazy people to do.  Everyone needs something to believe in.  I recommend Jesus Christ, but they want Tyler Durden."}, {author: "Brett Pascoe", review: "In my top 5 of all time favourite movies. Great story line and a movie you can watch over and over again."}],
        id: '550',
        genres: ['Drama'],
        runtime: '139'})

        allow(MovieFacade).to receive(:create_movie).and_return(@movie)

        @user1 = create(:user)
        @user2 = create(:user)
        @user3 = create(:user)
        Friendship.create!(user: @user1, friend: @user2)
        Friendship.create!(user: @user1, friend: @user3)

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)

        visit "/movies/#{@movie.id}"
      end

      it 'user sends out default emails to users when creating a watch party' do
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
            fill_in :start_time, with: Time.parse("2021-09-20 19:15")
            page.check "attendees[#{@user2.id}]"
            page.check "attendees[#{@user3.id}]"

            click_on 'Create Party'

            viewing_party = WatchParty.last

            mail = WatchPartyMailer.viewing_party_invitation(viewing_party)

            body = "You are invited to view #{viewing_party.movie} on #{viewing_party.date.strftime('%a, %b %e')} at #{viewing_party.start_time.strftime('%I:%M %P')}"

            expect(mail.subject).to eq("Viewing party invitation")
            expect(mail.from).to eq(["test@test.com"])
            expect(mail.to).to eq([@user2.email, @user3.email])
            expect(mail.body.raw_source).to eq(body)
          end
        end
      end
