require 'rails_helper'

RSpec.describe 'Movie Details(show) Page', :vcr do
  before :each do
    visit '/login'
    email = "example@example.com"
    password = "test"
    @user = User.create!(email: email, password: password)
    fill_in :email, with: email
    fill_in :password, with: password
    click_button "Log In"
  end

  describe 'When I visit the movie details page' do
    it 'can see button to create a viewing party' do
        visit "/movies/556574"

        expect(page).to have_button('Create Viewing Party for Movie')
        click_button 'Create Viewing Party for Movie'
        expect(current_path).to eq('/viewing-party/new')
    end

    it 'can see title, rating, run time, genres, and summary for movie' do
        visit "/movies/556574"

        summary = 'Presenting the tale of American founding father Alexander Hamilton, this filmed version of the original Broadway smash hit is the story of America then, told by America now.'

        expect(page).to have_content('Hamilton')
        expect(page).to have_content('8.5')
        expect(page).to have_content('2hr 40min')
        expect(page).to have_content('History')
        expect(page).to have_content('Music')
        expect(page).to have_content('Drama')
        expect(page).to have_content(summary)
    end

    it 'can see list of first 10 cast members names and characters' do
        visit "/movies/556574"

        expect(page).to have_content('Lin-Manuel Miranda')
        expect(page).to have_content('Alexander Hamilton')
        expect(page).to have_content('Okieriete Onaodowan')
        expect(page).to have_content('Hercules Mulligan / James Madison')
        expect(page).to have_content('Daveed Diggs')
        expect(page).to have_content('Marquis de Lafayette / Thomas Jefferson')
    end

    it 'can see count of total reviews, each author and their review' do
        visit "/movies/556574"
        a_review = 'This is not a Movie. It is a television program. It is a filmed stage play that is being broadcast on television. These things do not add up to this being a film, not even a TV-movie.'

        expect(page).to have_content('sykobanana')
        expect(page).to have_content('Peter M')
        expect(page).to have_content('CaptNemo')
        expect(page).to have_content(a_review)
    end

    it 'can see count of total reviews, each author and their review' do
      visit "/movies/556574"

      expect(page).to have_link('Elaine Stritch: At Liberty', href: '/movies/140595')
      expect(page).to have_link('Rocketman', href: '/movies/504608')
      expect(page).to have_link('Jesus Christ Superstar Live in Concert')
      expect(page).to have_link('Selena')
      expect(page).to have_link('The Greatest Showman')
    end
  end
end
