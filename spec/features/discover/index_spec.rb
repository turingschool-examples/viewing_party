require 'rails_helper'

describe "As an authenticated user when you visi the discover page" do
  before :each do
    @user_1 = User.create!(email: 'sassy@email.com', password: 'sassyperson1')
  end

  it "I see a welcome message with the name of the user" do
    visit root_path

    fill_in "email", with: @user_1.email
    fill_in "password", with: 'sassyperson1'
    click_button "Sign In"

    expect(current_path).to eq(dashboard_index_path)

    click_button('Discover Movies')

    expect(page).to have_content("Welcome #{@user_1.email}")
  end

  it "I see a button to discover the top rated 40 movies" do
    visit root_path

    fill_in "email", with: @user_1.email
    fill_in "password", with: 'sassyperson1'
    click_button "Sign In"

    expect(current_path).to eq(dashboard_index_path)

    click_button('Discover Movies')

    expect(current_path).to eq(discover_index_path)
    expect(page).to have_button('Find Top Rated Movies')
  end

  it "shows the top 40 rasted movies when I click Find Top Rated Movies button" do
    visit root_path

    fill_in "email", with: @user_1.email
    fill_in "password", with: 'sassyperson1'
    click_button "Sign In"

    expect(current_path).to eq(dashboard_index_path)

    click_button('Discover Movies')

    expect(current_path).to eq(discover_index_path)
    click_button('Find Top Rated Movies')

    expect(page).to have_content("Movie Name: ")
  end
end
