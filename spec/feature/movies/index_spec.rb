require 'rails_helper'

RSpec.describe 'movie discover page' do
  before(:each) do
    @user = User.create!(username: "eDog", email: "elah@email.com", password: "password")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  describe 'As an authenticated user' do
    describe "When I visit the movies page," do
      it "I should see the 40 results from my search," do
        visit "/movies"

        expect(page).to have_content("1. ")
        expect(page).to have_content("40. ")
      end
        it "I should also see the 'Find Top Rated Movies' button and the Find Movies form at the top of the page." do
          #
          # visit '/movies'
          #
          # expect(page).to have_content("Movie #40")
          #
      end
    end
  end
end
