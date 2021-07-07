require 'rails_helper'

RSpec.describe "welcome page" do
  before :each do
    visit root_path
  end

  it 'shows a welcome message' do
    expect(page).to have_content("Welcome to Viewing Party!")
  end

  it 'has a brief description of the application' do
    expect(page).to have_content("Browsing movies, create viewing partys, and invite friends!!!")
  end

  it 'creates new user' do
    save_and_open_page
    click_link 'Register here'

    expect(current_path).to eq('/register')

    username = "movielover3"
    password = "abc123"
    # save_and_open_page
    fill_in "user[username]", with: username
    fill_in "user[password]", with: password

    click_on "Create Account"

    expect(page).to have_content("Welcome, #{username}!")
  end
end