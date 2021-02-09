require "rails_helper"

describe MoviesService do
  describe '(happy path)' do
    it 'gets top movies' do
      VCR.use_cassette('movies_service_hp_top') do
        response = MoviesService.get_top_movies
        first_result = response[0]

        expect(response).to be_a(Array)
        expect(first_result).to be_a(Hash)
        expect(response.count).to eq(40)

       expect(first_result[:title]).to be_a(String)
       expect(first_result[:vote_average]).to be_a(Float)
       expect(first_result[:id]).to be_a(Integer)

      end
    end

    it "finds results for a movie" do
      VCR.use_cassette('movies_service_hp_search') do
        response = MoviesService.find_movies_by_name("a")
        first_result = response[0]

        expect(response).to be_a(Array)
        expect(first_result).to be_a(Hash)
        expect(response.count).to eq(40)

        expect(first_result[:title]).to be_a(String)
        expect(first_result[:vote_average]).to be_a(Float)
        expect(first_result[:id]).to be_a(Integer)

      end
    end

    it "gets cast of a movie" do
      VCR.use_cassette('movies_service_hp_top') do
        response = MoviesService.get_top_movies
        @first_result = response[0]
      end

      VCR.use_cassette('movies_service_hp_cast') do
        response_2 = MoviesService.get_cast(@first_result[:id])

        expect(response_2).to be_a(Array)

        expect(response_2.count).to eq(10)

        expect(response_2[0][:name]).to be_a(String)
      end
    end
  end

  describe "(sad path)" do
    it "returns top 40 movies if no search criteria are present" do
      VCR.use_cassette('movies_service_sp_search_empty_query') do
        response = MoviesService.find_movies_by_name("")
        first_result = response[0]

        expect(response).to be_a(Array)
        expect(first_result).to be_a(Hash)
        expect(response.count).to eq(40)

        expect(first_result[:title]).to be_a(String)
        expect(first_result[:vote_average]).to be_a(Float)
        expect(first_result[:id]).to be_a(Integer)

      end
    end
  end
end
