require 'rails_helper'

describe 'logging in' do
  it 'as a registered user, I can log in with correct credentials' do
    user = User.create(email: 'test123@xyz.com', password: 'viewparty')

    visit '/'
    # save_and_open_page

    within(".login-form") do
      expect(current_path).to eq("/")
      expect(find('form')).to have_content('Email')
      expect(find('form')).to have_content('Password')

      fill_in :email, with: "test123@xyz.com"
      fill_in :password, with: "viewparty"

      click_button "Sign In"
    end

    expect(current_path).to eq("/dashboard")
    expect(page).to_not have_link("New to Viewing Party? Register Here")
    expect(page).to have_content("test123@xyz.com is signed in")
    # expect(page).to have_link("Log out")
    #
    # click_link("Log out")

    # expect(current_path).to eq("/")
    # expect(page).to_not have_link("Log out")
    # expect(page).to have_link("New to Viewing Party? Register Here")
  end

  it 'as a registered user, I can not log in with incorrect credentials' do
    user = User.create(email: 'test123@xyz.com', password: 'viewparty')

    visit '/'

    within(".login-form") do
      fill_in :email, with: "test123@xyz.com"
      fill_in :password, with: "NOparty"

      click_button "Sign In"
    end

    expect(current_path).to eq("/")
    expect(page).to have_content("Your email or password are incorrect")
  end
end
