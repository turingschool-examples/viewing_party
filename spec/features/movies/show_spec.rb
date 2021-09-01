require 'rails_helper'

  RSpec.describe 'Movies Show Page', :vcr do
    describe 'create viewing party button' do
      it 'takes the user to the new viewing_party page' do
        user = create(:user)

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit "/movies/278"
        click_on("Create Viewing Party")
        expect(current_path).to eq(new_party_path)
      end
    end
    describe 'movie attributes' do
      it 'displays the correct movie attributes' do
        visit "/movies/278"
        #title
        expect(page).to have_content("The Shawshank Redemption")
        #vote average
        expect(page).to have_content("Average Vote: 8.7")

        #runtime in hours and minutes
        expect(page).to have_content('Runtime: 1 hour and 40 minutes')
        #genres
        expect(page).to have_content('Genres: Drama Crime')
        #summary
        summary = 'Framed in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope.'
        expect(page).to have_content(summary)
        #first 10 members of cast
        expect(page).to have_content('Tim Robbins')
        expect(page).to have_content('Larry Brandenburg')
        #review count
        expect(page).to have_content('6 reviews')
        #all reviews
        expect(page).to have_content("Some birds aren't meant to be caged.")
        expect(page).to have_content("I will not say that the film is predictable")
      end
    end
  end
