require 'rails_helper'

RSpec.describe 'Movies index page', type: :feature do
  before :each do
    @host = create(:user, password: 'password')
    login(@host)
    visit discover_index_path
  end

  it 'after clicking the top 40 movies from the discover page the top 40 movies are displayed', :vcr do
    click_on "Top 40 Movies"
    expect(current_path).to eq(movies_path)

    within "#movie-791373" do
      expect(page).to have_content("Zack Snyder's Justice League")
      expect(page).to have_content("8.7")
    end

    within "#movie-761053" do
      expect(page).to have_content("Gabriel's Inferno Part III")
      expect(page).to have_content("8.7")
    end

    within "#movie-155" do
      expect(page).to have_content("The Dark Knight")
      expect(page).to have_content("8.5")
    end

    within "#movie-122" do
      expect(page).to have_content("Lord of the Rings: The Return of the King")
      expect(page).to have_content("8.5")
    end
  end

  it 'should have a search form that returns movies with similar titles', :vcr do
    fill_in :search, with: 'Jack Reacher'
    click_on 'Search'

    within "#movie-75780" do
      expect(page).to have_content('Jack Reacher')
      expect(page).to have_content('6.5')
    end

    within "#movie-343611" do
      expect(page).to have_content('Jack Reacher: Never Go Back')
      expect(page).to have_content('5.8')
    end
  end

  it 'from the movie search movie index you can click top 40 and see the top 40 movies', :vcr do
    click_on "Top 40 Movies"

    within "#movie-791373" do
      expect(page).to have_content("Zack Snyder's Justice League")
      expect(page).to have_content("8.7")
    end

    within "#movie-761053" do
      expect(page).to have_content("Gabriel's Inferno Part III")
      expect(page).to have_content("8.7")
    end
  end

  it 'should have a search form that returns movies with similar titles', :vcr do
    fill_in :search, with: 'Jack Reacher'
    click_on 'Search'

    within "#movie-75780" do
      expect(page).to have_content('Jack Reacher')
      expect(page).to have_content('6.5')
    end

    within "#movie-343611" do
      expect(page).to have_content('Jack Reacher: Never Go Back')
      expect(page).to have_content('5.8')
    end
  end

  it 'each movie title should be a link to the movie details page top 40', :vcr do
    click_on 'Top 40 Movies'
    expect(current_path).to eq(movies_path)

    within "#movie-791373" do
      expect(page).to have_link("Zack Snyder's Justice League")
      click_link("Zack Snyder's Justice League")

      expect(current_path).to eq(movie_path(791373))
    end
  end

  it 'each movie title should be a link to the movie details page search', :vcr do
    visit discover_index_path

    fill_in :search, with: 'Jack Reacher'
    click_on 'Search'
    expect(current_path).to eq(movies_path)

    within "#movie-75780" do
      expect(page).to have_link('Jack Reacher')
      click_link("Jack Reacher")

      expect(current_path).to eq(movie_path(75780))
    end
  end
end
