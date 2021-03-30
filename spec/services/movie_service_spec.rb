require 'rails_helper'

RSpec.describe "Movie Service" do
  describe ".top_movies" do
    it "returns the first 40 top rated movies in an array" do
      VCR.use_cassette('top_50_movies') do
        limit = 50
        expect(MovieService.top_rated(limit)).to be_an(Array)
        expect(MovieService.top_rated(limit)[0]).to be_an(OpenStruct)
        expect(MovieService.top_rated(limit).length).to eq(limit)
      end
    end

    it "returnes an error if the request is not completed" do
      api_key = ENV['movie_api_key']
      stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{api_key}&language=en-US&page=1").
        to_return(status: 500, body: "", headers: {})

      limit = 40
      data = MovieService.top_rated(limit)

      expect(data).to eq({error: true})
    end
  end

  describe ".create_objects" do
    describe "happy path" do
      before :each do
      @limit = 2
      @info = [{:id=>19404,
                :poster_path=>"/2CAL2433ZeIihfX1Hb2139CX0pW.jpg",
                :title=>"Dilwale Dulhania Le Jayenge",
                :video=>false,
                :vote_average=>8.7,
                :vote_count=>2748},
               {:id=>724089,
                :poster_path=>"/pci1ArYW7oJ2eyTo2NMYEKHHiCP.jpg",
                :title=>"Gabriel's Inferno Part II",
                :video=>false,
                :vote_average=>8.7,
                :vote_count=>1219},
               {:id=>278,
                :poster_path=>"/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg",
                :release_date=>"1994-09-23",
                :title=>"The Shawshank Redemption",
                :video=>false,
                :vote_average=>8.7,
                :vote_count=>18615}]
          end
      it "creates an array of OpenStruct oblects" do
        expect(MovieService.create_objects(@info, @limit)).to be_an(Array)
        expect(MovieService.create_objects(@info, @limit).length).to eq(2)
        expect(MovieService.create_objects(@info, @limit)[0]).to be_an(OpenStruct)
      end

      it "each OpenStruct oblect has only the relevent info" do
        data = MovieService.create_objects(@info, @limit)[0]

        expect(data).to be_an(OpenStruct)
        expect(data).to respond_to(:id)
        expect(data).to respond_to(:title)
        expect(data).to respond_to(:vote_average)
        expect(data).to respond_to(:poster_path)
        expect(data).to_not respond_to(:vote_count)
        expect(data).to_not respond_to(:video)
        expect(data).to_not respond_to(:release_date)
      end
    end

    describe "sad path" do
      it "does not error if info missing" do
        limit = 2
        info = [{}, {}, {}]

        data = MovieService.create_objects(info, limit)[0]

        expect(data).to be_an(OpenStruct)
        expect(data).to respond_to(:id)
        expect(data).to respond_to(:title)
        expect(data).to respond_to(:vote_average)
        expect(data).to respond_to(:poster_path)
        expect(data).to_not respond_to(:vote_count)
        expect(data).to_not respond_to(:video)
        expect(data).to_not respond_to(:release_date)
      end
    end
  end
end
