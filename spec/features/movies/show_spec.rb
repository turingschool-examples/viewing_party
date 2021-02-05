require 'rails_helper'

RSpec.describe 'movies show page', type: :feature do
    describe 'as a user' do
        before(:each) do
            # REPLACE THIS WITH WEBMOCK AND STUB
            @movie = Movie.create!(mdb_id: '01234')
            @movie_info = MovieDbFacade.get_movie_info(@movie.mdb_id)
            visit movie_path(@movie.id)
        end

        describe "happy path" do
            it "displays movie information" do
            # REPLACE THIS ONCE WE WEBMOCK
                expect(page).to have_content(@movie_info.title)
            end

            it "displays cast informtion" do
            end

            it "displays review informtion" do
            end
        end
    end
end
