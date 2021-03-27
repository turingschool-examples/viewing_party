require 'rails_helper'

describe "As an authenticated user when you visi the discover page" do
  before :each do
    @user_1 = User.create!(email: 'sassy@email.com', password: 'sassyperson1')
  end

  it "I see a welcome message with the name of the user" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_1)

    visit discover_index_path

    expect(page).to have_content("Welcome #{@user_1.email}")
  end

  it "I see a button to discover the top rated 40 movies" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_1)

    visit discover_index_path

    VCR.use_cassette('top_movie_data') do
      click_button('Find Top Rated Movies')
      expect(current_path).to eq(movies_index_path)
    end

    expect(page).to have_button('Find Top Rated Movies')
  end

  it "takes the user to movie page when they click 'Find Movies'" do
    visit root_path
    VCR.use_cassette('top_movie_data') do
      fill_in "email", with: @user_1.email
      fill_in "password", with: 'sassyperson1'
      click_button "Sign In"
      # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_1)

      visit dashboard_index_path

      expect(current_path).to eq(dashboard_index_path)

      click_button('Discover Movies')

      expect(current_path).to eq(discover_index_path)

      fill_in "find_movie", with: 'good movie'

      click_button('Find Movies')

      expect(current_path).to eq(movies_index_path)
    end
  end
end
