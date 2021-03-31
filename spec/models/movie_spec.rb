require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'relationships' do
    it {should have_many(:viewing_events)}
  end

  describe 'class methods' do
    describe '::find_or_create' do
      it "creates a movie if an existing record is not found" do
        movie_info = {movie_db_id: 1, title: "Movie", runtime: 120}

        expect(Movie.find_by(movie_db_id: movie_info[:movie_db_id]).nil?).to eq(true)
        expect(Movie.find_or_create(movie_info)).to be_a(Movie)
        expect(Movie.find_by(movie_db_id: movie_info[:movie_db_id]).nil?).to eq(false)
      end

      it "does not create a movie if an existing record is found" do
        movie = Movie.create!(movie_db_id: 1, title: "Movie", runtime: 120)
        movie_info = {movie_db_id: movie.movie_db_id, title: movie.title, runtime: movie.runtime}

        expect(Movie.find_by(movie_db_id: movie_info[:movie_db_id]).nil?).to eq(false)
        expect(Movie.find_or_create(movie_info)).to be_a(Movie)
        expect(Movie.where(movie_db_id: movie_info[:movie_db_id]).count).to eq(1)
      end
    end
  end
end
