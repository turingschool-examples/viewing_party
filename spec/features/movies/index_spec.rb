require 'rails_helper'

describe "As an authenticated user when you visit the discover page" do
  before :each do
    @user_1 = User.create!(email: 'sassy@email.com', password: 'sassyperson1')
  end

  it "takes the user to movie page when they click 'Find Movies'" do
    # visit root_path
      # fill_in "email", with: @user_1.email
      # fill_in "password", with: 'sassyperson1'
      # click_button "Sign In"
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_1)

    visit dashboard_index_path

    expect(current_path).to eq(dashboard_index_path)

    click_button('Discover Movies')

    expect(current_path).to eq(discover_index_path)

    VCR.use_cassette('top_movie_data') do
      click_button('Find Top Rated Movies')
      expect(page).to have_content("Redemption")
    end
  end
end
