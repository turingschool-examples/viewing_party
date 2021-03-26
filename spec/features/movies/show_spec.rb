require 'rails_helper'

RSpec.describe 'Movies details page', type: :feature do
  before :each do
    @host = create(:user, password: 'password')
    login(@host)
    @movie = MovieService.movie_object(100)
    visit movie_path(@movie.id)
  end

  it 'shows all of the movies details' do

  end
end
