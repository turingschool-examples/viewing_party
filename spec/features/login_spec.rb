require 'rails_helper'

describe 'logging in' do
  it 'as a registered user, I can log in with correct credentials' do
    user = User.create(email: 'test123@xyz.com', password: 'viewparty')

    visit login_path
    # save_and_open_page
    expect(current_path).to eq("/login")
    expect(find('form')).to have_content('Email')
    expect(find('form')).to have_content('Password')


    fill_in :email, with: "test123@xyz.com"
    fill_in :password, with: "viewparty"

    click_button "Log in"

    expect(current_path).to eq(login_path)
    expect(page).to have_content("Welcome, test123@xyz.com!")
    expect(page).to_not have_link("New to Viewing Party? Register Here")
    expect(page).to have_link("Log out")

    click_link("Log out")

    expect(current_path).to eq(login_path)
    expect(page).to_not have_link("Log out")
    expect(page).to have_link("New to Viewing Party? Register Here")
  end

  it 'as a registered user, I can not log in with incorrect credentials' do
    user = User.create(email: 'test123@xyz.com', password: 'viewparty')

    visit login_path

    fill_in :email, with: "test123@xyz.com"
    fill_in :password, with: "noparty"

    click_button "Log in"

    expect(current_path).to eq(login_path)
    expect(page).to have_content("Your email or password are incorrect")
  end
end
