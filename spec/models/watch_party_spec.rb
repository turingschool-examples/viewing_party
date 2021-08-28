require 'rails_helper'

RSpec.describe WatchParty, type: :model do
  describe 'relationships' do
    it { should have_many(:attendees) }
    it { should have_many(:users).through(:attendees) }
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of(:movie) }
  end

  before :each do

  end

  # describe 'class methods' do
  #  describe '.' do
  #   end
  # end

  describe 'instance methods' do
    describe '#movie' do
      it 'can create a movie for the watch party' do
        movie = Movie.new({original_title: 'Fight Club',
          overview: "A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy.",
          vote_average: '8.4',
          genres: ["Drama"],
          cast: [{name: "Edward Norton", character: "The Narrator"}, {name: "Brad Pitt", character: "Tyler Durden"}],
          reviews: [{author: "Goddard", review: "Pretty awesome movie.  It shows what one crazy person can convince other crazy people to do.  Everyone needs something to believe in.  I recommend Jesus Christ, but they want Tyler Durden."}, {author: "Brett Pascoe", review: "In my top 5 of all time favourite movies. Great story line and a movie you can watch over and over again."}],
          id: '550',
          genres: ['Drama'],
          runtime: '139'})

          allow(MovieFacade).to receive(:create_movie).and_return(movie)

          user = create(:user)
          watch_party = WatchParty.create!(movie: "Fight Club", date: "20/9/2021", start_time: Time.parse("2021-09-20 19:15"), movie_id: '550', user: user)

          expect(watch_party.chosen_movie).to eq(movie)
        end
      end
    end
  end
