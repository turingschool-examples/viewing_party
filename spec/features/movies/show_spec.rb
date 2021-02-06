require 'rails_helper'

RSpec.describe 'movies show page', type: :feature do
    describe 'as a user' do
        before(:each) do
            # REPLACE THIS WITH WEBMOCK AND STUB
            @movie = Movie.create!(mdb_id: '2')
            @movie_info = MovieDbFacade.get_movie_info(@movie.mdb_id)
            visit movie_path(@movie.id)
        end

        describe "happy path" do
            it "displays movie information from movie API path" do
                expect(page).to have_content(@movie_info.title)
                expect(page).to have_content("Vote Average: #{@movie_info.vote_average}")
                expect(page).to have_content("Runtime: #{@movie_info.runtime}")
                expect(page).to have_content("Genres: Drama, Crime, Comedy")
            end

            xit "displays cast informtion" do
            end

            xit "displays review informtion" do
            end
        end
    end
end
