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
    
    visit "/discover"
  end
  
  it 'can visit a viewing party form' do
    
    json_response = File.read('spec/fixtures/search_movie.json')


    stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['movie_key']}&include_adult=false&page=1&query=fight%20club").
         with(
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'User-Agent'=>'Faraday v1.7.0'
           }).
         to_return(status: 200, body: json_response, headers: {})

    movies = MovieService.new.movie_search('fight club')

    visit '/discover'

    fill_in :search, with: "fight club"
    click_on "Search Movies!"
            
    within(first('.movies-search')) do
      click_on "Fight Club"
    end


    click_on 'Create a Viewing Party for Movie'

    expect(current_path).to eq("/viewing_party/new")

    expect(page).to have_content("The Suicide Squad")
    expect(page).to have_field("Duration of Party")
    expect(page).to have_field("Day")
    expect(page).to have_field("Start Time")
    expect(page).to have_button("Create Party")
  end
end