require 'rails_helper'

RSpec.describe "welcome page" do
  before :each do
    visit root_path
  end

  it 'shows a welcome message' do
    expect(page).to have_content("Welcome to Viewing Party!")
  end

  it 'has a brief description of the application' do
    expect(page).to have_content("Browse movies, create viewing partys, and invite friends!!!")
  end

  it 'has a link to register user' do
    click_link 'Register here'

    expect(current_path).to eq('/register')
  end

  it 'has a link to log out' do
    user = User.create(username: 'person@ex.com', password: 'ilovecatsanddogs')

    visit root_path

    click_on "Log in here"
    expect(current_path).to eq("/login")

    fill_in :username, with: "person@ex.com"
    fill_in :password, with: "ilovecatsanddogs"

    click_on "Log in"

    expect(page).to have_content('Log out')

    click_on "Log out"

    expect(current_path).to eq('/')
  end
end