require 'rails_helper'

RSpec.describe MovieFacade do
  before :each do
    @movie_facade = MovieFacade.new
  end

  it 'can verify that it exists' do
    expect(@movie_facade).to be_an_instance_of(MovieFacade)
    expect(@movie_facade.service).to be_an_instance_of(MovieService)
  end

  it 'can create a movie' do
    movie = @movie_facade.create_movie('550')

    expect(movie).to be_an_instance_of(Movie)
    expect(movie.title).to eq("Fight Club")
  end

  it 'can create 40 popular movies' do
    expect(@movie_facade.top_movies.count).to eq(40)
  end

  it 'can return a hash of a given movie cast' do
    response = [{  adult: false,
            gender: 2,
            id: 819,
            known_for_department: "Acting",
            name: "Edward Norton",
            original_name: "Edward Norton",
            popularity: 16.152,
            profile_path: "/5XBzD5WuTyVQZeS4VI25z2moMeY.jpg",
            cast_id: 4,
            character: "The Narrator",
            credit_id: "52fe4250c3a36847f80149f3",
            order: 0},
        {
            adult: false,
            gender: 2,
            id: 287,
            known_for_department: "Acting",
            name: "Brad Pitt",
            original_name: "Brad Pitt",
            popularity: 25.011,
            profile_path: "/ajNaPmXVVMJFg9GWmu6MJzTaXdV.jpg",
            cast_id: 5,
            character: "Tyler Durden",
            credit_id: "52fe4250c3a36847f80149f7",
            order: 1}]

    allow_any_instance_of(MovieService).to receive(:get_cast).and_return(response)

    expected = [{name: "Edward Norton", character: "The Narrator"}, {name: "Brad Pitt", character: "Tyler Durden"}]

    expect(@movie_facade.cast_information('550')).to eq(expected)
  end

  it 'can return a hash of just review information for a given movie' do
    response = [{
            author: "Goddard",
            content: "Pretty awesome movie.  It shows what one crazy person can convince other crazy people to do.  Everyone needs something to believe in.  I recommend Jesus Christ, but they want Tyler Durden.",
            updated_at: "2021-06-23T15:58:09.421Z",},
            {author: "Brett Pascoe",
            content: "In my top 5 of all time favourite movies. Great story line and a movie you can watch over and over again.",
            updated_at: "2021-06-23T15:58:10.199Z"}]

    allow_any_instance_of(MovieService).to receive(:get_review).and_return(response)

    expected = [{author: "Goddard", review: "Pretty awesome movie.  It shows what one crazy person can convince other crazy people to do.  Everyone needs something to believe in.  I recommend Jesus Christ, but they want Tyler Durden."}, {author: "Brett Pascoe", review: "In my top 5 of all time favourite movies. Great story line and a movie you can watch over and over again."}]

    expect(@movie_facade.movie_review_info('550')).to eq(expected)
  end

  it 'can create a movie information hash' do
    cast_response = [{  adult: false,
            gender: 2,
            id: 819,
            known_for_department: "Acting",
            name: "Edward Norton",
            original_name: "Edward Norton",
            popularity: 16.152,
            profile_path: "/5XBzD5WuTyVQZeS4VI25z2moMeY.jpg",
            cast_id: 4,
            character: "The Narrator",
            credit_id: "52fe4250c3a36847f80149f3",
            order: 0},
        {
            adult: false,
            gender: 2,
            id: 287,
            known_for_department: "Acting",
            name: "Brad Pitt",
            original_name: "Brad Pitt",
            popularity: 25.011,
            profile_path: "/ajNaPmXVVMJFg9GWmu6MJzTaXdV.jpg",
            cast_id: 5,
            character: "Tyler Durden",
            credit_id: "52fe4250c3a36847f80149f7",
            order: 1}]

    allow_any_instance_of(MovieService).to receive(:get_cast).and_return(cast_response)

    review_response = [{
            author: "Goddard",
            content: "Pretty awesome movie.  It shows what one crazy person can convince other crazy people to do.  Everyone needs something to believe in.  I recommend Jesus Christ, but they want Tyler Durden.",
            updated_at: "2021-06-23T15:58:09.421Z",},
            {author: "Brett Pascoe",
            content: "In my top 5 of all time favourite movies. Great story line and a movie you can watch over and over again.",
            updated_at: "2021-06-23T15:58:10.199Z"}]

    allow_any_instance_of(MovieService).to receive(:get_review).and_return(review_response)

    response = {original_title: "Fight Club",
    overview: "A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground \"fight clubs\" forming in every town, until an eccentric gets in the way and ignites an out-of-control spiral toward oblivion.",
    popularity: 52.24,
    poster_path: "/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg",
    status: "Released",
    tagline: "Mischief. Mayhem. Soap.",
    title: "Fight Club",
    video: false,
    runtime: "139",
    vote_average: "8.4",
    vote_count: 22270}

    allow_any_instance_of(MovieService).to receive(:get_movie).and_return(response)

    expected = {original_title: 'Fight Club',
                overview: "A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground \"fight clubs\" forming in every town, until an eccentric gets in the way and ignites an out-of-control spiral toward oblivion.",
                vote_average: '8.4',
                genres: ["Drama"],
                cast: [{name: "Edward Norton", character: "The Narrator"}, {name: "Brad Pitt", character: "Tyler Durden"}],
                reviews: [{author: "Goddard", review: "Pretty awesome movie.  It shows what one crazy person can convince other crazy people to do.  Everyone needs something to believe in.  I recommend Jesus Christ, but they want Tyler Durden."}, {author: "Brett Pascoe", review: "In my top 5 of all time favourite movies. Great story line and a movie you can watch over and over again."}]}

    expect(@movie_facade.movie_information('550')).to eq(expected)
  end
end
