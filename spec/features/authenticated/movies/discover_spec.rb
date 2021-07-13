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
    # save_and_open_page

    expect(current_path).to eq(discover_path)
    expect(page).to have_content("Welcome test123!")
    expect(page).to have_button("Find Top Rated Movies")
  end

  it 'has search form and button Find movies' do
    expect(current_path).to eq(discover_path)
    expect(page).to have_field('title')
    expect(page).to have_button('Find Top Rated Movies')
  end

end
