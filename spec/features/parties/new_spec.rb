require 'rails_helper'

RSpec.describe "New Party Page" do
  describe "As an authenticated user" do
    describe "When I visit the new viewing party page" do
      it "I should see the name of the movie title rendered above a form with some fields" do
        visit new_party_path
          within "#party-info" do
            expect(page).to have_css("#movie-title")
            expect(page).to have_field("party[date]")
            expect(page).to have_field("party[time]")
          end
      end
    end
  end
end
