require 'rails_helper'

RSpec.describe 'Top Forty Search Feature' do
  describe 'As a registered user' do
    before :each do
      @user = User.create!(email: "John@example.com", password: "password")
      visit root_path

      fill_in :email, with: @user.email
      fill_in :password, with: @user.password

      click_button("Log In")
    end

    describe "User can click on 'Find Top Rated Movies' button" do
      it 'I see the top forty highest rated movies', :vcr do
        visit discover_index_path

        click_button("Find Top Rated Movies")

        within(first('.movie')) do
          expect(page).to have_css('.title')
          title = find('.title').text
          expect(title).to_not be_empty

          expect(page).to have_css('.vote_average')
          vote_average = find('.vote_average').text
          expect(vote_average).to_not be_empty
        end
      end
    end
  end
end
