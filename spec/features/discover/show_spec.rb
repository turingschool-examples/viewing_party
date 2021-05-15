require 'rails_helper'

describe 'Movie Detail (Show) Page' do
  before :each do
    user = User.create(user_name: 'joeyh@test.com', password: 'doyouwanttohearasong')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit discover_movies_path
    click_button 'Discover Top 40 Movies'
    click_link 'Mortal Kombat'
  end

  describe "As an authenticated user, when I visit the movie's detail page" do
    xit 'has a button to create a viewing party that takes the user to the new party page' do
      expect(current_path).to eq(movie_detail_path)
      expect(page).to have_button('Create a New Viewing Party')

      click_button 'Create a New Viewing Party'
      expect(current_path).to eq(new_party_path)
    end
    it 'It Display all pertitnate data about a movie' do
      save_and_open_page
      expect(page).to have_content('Title: Mortal Kombat')
      expect(page).to have_content('Vote Average: 7.7')
      expect(page).to have_content('Run Time: 1:50')
      expect(page).to have_content('Action')
      expect(page).to have_content('Fantasy')
      expect(page).to have_content('Adventure')
      expect(page).to have_content("Washed-up MMA fighter Cole Young, unaware of his heritage, and hunted by Emperor Shang Tsung's best warrior, Sub-Zero, seeks out and trains with Earth's greatest champions as he prepares to stand against the enemies of Outworld in a high stakes battle for the universe.")
      expect(page).to have_content('Character: Cole Young')
      expect(page).to have_content('Actor/Actress: Lewis Tan')
      expect(page).to have_content('Character: Sonya Blade')
      expect(page).to have_content('Actor/Actress: Jessica McNamee')
      expect(page).to have_content('Total Reviews: 5')
      expect(page).to have_content('Reviewer: TheDarkKnight31')
      expect(page).to have_content('Rating: 10.0')
      expect(page).to have_content('Reviewer: garethmb')
      expect(page).to have_content('Rating: ')
    end
  end

  # And I should see the following information about the movie:
  # Movie Title
  # Vote Average of the movie
  # Runtime in hours & minutes
  # Genere(s) associated to movie
  # Summary description
  # List the first 10 cast members (characters&actress/actors)
  # Count of total reviews
  # Each review's author and information
  # Details: This information should come from 3 different endpoints from The Movie DB API
end
