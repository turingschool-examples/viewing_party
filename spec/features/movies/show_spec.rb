require 'rails_helper'
include ActionView::Helpers::NumberHelper

RSpec.describe 'Movie Details Page' do
  describe 'As an authenticated user' do
    before :each do
      visit "/movies/278"
    end

    it "I can see a button to create a viewing party" do
      expect(page).to have_button("Create Viewing Party")
    end

    it "I can see Movie Details" do
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

      expect(page).to have_content("Framed in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope.")
    end

  end
end
