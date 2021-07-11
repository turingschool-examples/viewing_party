require 'rails_helper'

describe 'discover movies page' do
  before(:each)do
    @user = User.create(email: 'test123@xyz.com', password: 'viewparty')
    visit welcome_path
    fill_in :email, with: "test123@xyz.com"
    fill_in :password, with: "viewparty"
    click_button "Sign In"
    click_button "Discover Movies"
  end

  it 'has button Find Top Rated Movies' do
    save_and_open_page

    expect(current_path).to eq(discover_path)
    expect(page).to have_content("Welcome test123!")
    expect(page).to have_button("Find Top Rated Movies")
  end

  xit 'shows Top Rated Movies' do
    expect(current_path).to eq(discover_path)
    click_button "Find Top Rated Movies"

    expect(current_page).to have_content("title1")
  end

  it 'has search form and button Find movies' do
    expect(current_path).to eq(discover_path)
    expect(find('form')).to have_content('Search')
    expect(page).to have_button("Find Movies")
  end

  it 'lists search results' do

  end

    # expect(page).to_not have_link("New to Viewing Party? Register Here")
    # expect(page).to have_link("Log out")

  # it 'as a registered user, I can not log in with incorrect credentials' do
  #   fill_in :email, with: "test123@xyz.com"
  #   fill_in :password, with: "NOparty"
  #   click_button "Sign In"
  #
  #   expect(current_path).to eq(welcome_path)
  #   expect(page).to have_content("Your email or password are incorrect")
  # end
end
