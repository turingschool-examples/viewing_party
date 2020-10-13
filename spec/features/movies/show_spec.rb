require 'rails_helper'
include ActionView::Helpers::NumberHelper

feature 'Details for a movie' do
  scenario "User visits a movie's page", :vcr do
    @user = User.create!(name: 'Phil', email: 'a@a.com', password: 'a', password_confirmation: 'a')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      visit "/movies/278"

      expect(page).to have_content("The Shawshank Redemption")
      expect(page).to have_content("Vote Average: 8.7")
      expect(page).to have_content("Runtime: 2hrs, 22 minutes")
      expect(page).to have_content("Drama")
      expect(page).to have_content("Crime")

      expect(page).to have_content("Tim Robbins as Andy Dufresne")
      expect(page).to have_content('Morgan Freeman as Ellis Boyd "Red" Redding')
      expect(page).to have_content("Bob Gunton as Warden Samuel Norton")
      expect(page).to have_content("William Sadler as Heywood")
      expect(page).to have_content("Clancy Brown as Captain Byron T. Hadley")
      expect(page).to have_content("Gil Bellows as Tommy")
      expect(page).to have_content("Mark Rolston as Bogs Diamond")
      expect(page).to have_content("James Whitmore as Brooks Hatlen")
      expect(page).to have_content("Jeffrey DeMunn as 1946 D.A.")
      expect(page).to have_content("Larry Brandenburg as Skeet")

      expect(page).to have_content("Reviews: 6")
      expect(page).to have_content("elshaarawy")
      expect(page).to have_content("John Chard")
      expect(page).to have_content("tmdb73913433")
      expect(page).to have_content("thommo_nz")
      expect(page).to have_content("Andrew Gentry")
      expect(page).to have_content("Matthew Dixon")
  end
end
