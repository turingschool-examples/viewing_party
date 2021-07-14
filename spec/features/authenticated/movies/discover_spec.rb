require 'rails_helper'

RSpec.describe 'discover movies page' do
  before(:each)do
    @user = User.create(email: 'test123@xyz.com', password: 'viewparty')
    visit welcome_path
    fill_in :email, with: "test123@xyz.com"
    fill_in :password, with: "viewparty"
    click_button "Sign In"
    click_button "Discover Movies"
  end

  it 'has button Find Top Rated Movies' do
    expect(current_path).to eq(discover_path)
    expect(page).to have_content("Welcome test123!")
    expect(page).to have_button("Find Top Rated Movies")
  end

  it 'has search form and button Find Top Rated Movies' do
    expect(current_path).to eq(discover_path)
    expect(page).to have_button('Find Top Rated Movies')
    expect(page).to have_button('Find Movies')
  end

  it 'has Dashboard link to Dashboard Page' do
    expect(current_path).to eq(discover_path)
    expect(page).to have_link("Dashboard")
    click_link("Dashboard")

    expect(current_path).to eq(dashboard_path)
    expect(page).to_not have_link("Dashboard")
    expect(page).to have_button("Discover Movies")
  end

  it 'has Logout link to Welcome Page' do
    expect(current_path).to eq(discover_path)
    expect(page).to have_link("Log out")
    click_link("Log out")

    expect(current_path).to eq(welcome_path)
    expect(page).to_not have_link("Log out")
    expect(page).to have_content("Welcome to Viewing Party")
    expect(page).to have_link("New to Viewing Party? Register Here")
  end

end
