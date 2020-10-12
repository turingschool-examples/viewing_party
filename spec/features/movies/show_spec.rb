require 'rails_helper'

RSpec.describe 'movie details page', type: :feature do
  describe 'page' do
    before :each do
      user = create :user

      visit '/'

      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password

      click_on 'Log in'
    end

    it 'can show details' do

      visit "/movies/500"

     
      expect(page).to have_button('Create Viewing Party!')
      expect(page).to have_content("Reservoir Dogs")
      expect(page).to have_content("8.2")
      expect(page).to have_content("1 hour(s) and 39 minutes")
      expect(page).to have_content("Crime")
      expect(page).to have_content("Thriller")
      expect(page).to have_content("A botched robbery indicates a police informant, and the pressure mounts")
      within '.cast' do
        # expect(@movie.cast.count).to eq(10)
        expect(page).to have_content("Harvey Keitel as Mr. White / Larry Dimmick")
        expect(page).to have_content("Tim Roth as Mr. Orange / Freddy Newandyke")
        expect(page).to have_content("Michael Madsen as Mr. Blonde / Vic Vega")
      end
      within '.reviews' do
        expect(page).to have_content("2")
        expect(page).to have_content("talisencrw")
        expect(page).to have_content("This unique take on the heist-film-gone-wrong")
        expect(page).to have_content("Wuchak")
        expect(page).to have_content("The cuss-oriented squabbles of lowlife crooks")
      end
    end
  end
end