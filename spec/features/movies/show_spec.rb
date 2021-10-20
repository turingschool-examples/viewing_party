require 'rails_helper'
RSpec.describe 'movie show page' do

#   As an authenticated user,
# When I visit the movie's detail page,
# I should see
#
#  Button to create a viewing party
# Details This button should take the authenticated user to the new event page
#
# And I should see the following information about the movie:
#
#  Movie Title
#  Vote Average of the movie
#  Runtime in hours & minutes
#  Genere(s) associated to movie
#  Summary description
#  List the first 10 cast members (characters&actress/actors)
#  Count of total reviews
#  Each review's author and information
  before :each do
    @movie = Movie.new()
    visit "/movies/#{@movie.id}"
  end
  it 'has a button to create a viewing party' do
    expect(page).to have_button('Create Viewing Party')

    click_button 'Create Viewing Party'

    expect(current_path).to eq("/events/new")
  end

  xit 'displays the movie title' do
    expect(page).to have_content(@moive.title)
  end

  xit 'displays the movie vote average' do
    expect(page).to have_content(@movie.vote_average)
  end

  xit 'displays the movie runtime' do
    expect(page).to have_content(@movie.runtime)
  end

  xit 'displays the movie genre(s)' do
    expect(page).to have_content(@movie.genres)
  end

  xit 'displays the movie overview' do
    expect(page).to have_content(@movie.overview)
  end

  xit 'displays the movie cast members' do
    expect(page).to have_content(@movie.first_10_cast_members)
  end

  xit 'displays the movies total reviews' do
    expect(page).to have_content(@movie.total_results)
  end

  xit 'displays the movie reviews authors and information' do
    expect(page).to have_content(@movie.reviews[authors])
    expect(page).to have_content(@movie.reviews[authors][details])
  end
end
