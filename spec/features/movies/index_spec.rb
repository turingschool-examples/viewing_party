require 'rails_helper'

RSpec.describe 'Movies index page', type: :feature do
  before :each do
    @host = create(:user, password: 'password')
    login(@host)
    visit discover_index_path
    @movies ||= MovieService.top_40_objects
    @search ||= MovieService.movie_search_objects('Jack Reacher')
  end

  it 'after clicking the top 40 movies from the discover page the top 40 movies are displayed' do
    click_on 'Top 40 Movies'
    expect(current_path).to eq(movies_path)

    expect(page).to have_content(@movies.first.title)
    expect(page).to have_content(@movies.first.vote_average)
    expect(page).to have_content(@movies.last.title)
    expect(page).to have_content(@movies.last.vote_average)
  end

  it 'should have a search form that returns movies with similar titles' do
    fill_in :search, with: 'Jack Reacher'
    click_on 'Search'

    expect(page).to have_content(@search.first.title)
    expect(page).to have_content(@search.first.vote_average)
    expect(page).to have_content(@search.last.title)
    expect(page).to have_content(@search.last.vote_average)
  end

  it 'from the movie search movie index you can click top 40 and see the top 40 movies' do
    fill_in :search, with: 'Jack Reacher'
    click_on 'Search'

    click_on "Top 40 Movies"

    expect(page).to have_content(@movies.first.title)
    expect(page).to have_content(@movies.first.vote_average)
    expect(page).to have_content(@movies.last.title)
    expect(page).to have_content(@movies.last.vote_average)
  end

  it 'should have a search form that returns movies with similar titles' do
    click_on 'Top 40 Movies'
    expect(current_path).to eq(movies_path)

    fill_in :search, with: 'Jack Reacher'
    click_on 'Search'

    expect(page).to have_content(@search.first.title)
    expect(page).to have_content(@search.first.vote_average)
    expect(page).to have_content(@search.last.title)
    expect(page).to have_content(@search.last.vote_average)
  end

  it 'each movie title should be a link to the movie details page' do
    click_on 'Top 40 Movies'
    expect(current_path).to eq(movies_path)

    within "#movie-#{@movies.first.id}" do
      expect(page).to have_link(@movies.first.title)
      click_link(@movies.first.title)

      expect(current_path).to eq(movie_path(@movies.first.id))
    end

    visit discover_index_path

    click_on 'Top 40 Movies'
    expect(current_path).to eq(movies_path)

    within "#movie-#{@movies.last.id}" do
      expect(page).to have_link(@movies.last.title)
      click_link(@movies.last.title)

      expect(current_path).to eq(movie_path(@movies.last.id))
    end
  end
end
