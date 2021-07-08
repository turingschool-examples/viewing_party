require 'rails_helper'

RSpec.describe "registration page" do
  before :each do
    visit '/register'
  end

  it 'has a link to register user' do
    username = "movielover3"
    password = "abc123"

    fill_in "user[username]", with: username
    fill_in "user[password]", with: password
    fill_in "user[password_confirmation]", with: password

    click_on "Create Account"

    expect(page).to have_content("Welcome, #{username}!")
  end

  it 'confirms the password' do
    username = "movielover3"
    password = "abc123"
    password_confirmation = "blahblah"

    fill_in "user[username]", with: username
    fill_in "user[password]", with: password
    fill_in "user[password_confirmation]", with: password_confirmation

    click_on "Create Account"

    expect(current_path).to eq('/users')
    expect(page).to have_content("Must fill out all fields/confirm password")
  end

  it 'requires all fields to be filled out' do
    username = "movielover3"
    password = "abc123"

    fill_in "user[username]", with: username
    fill_in "user[password]", with: password

    click_on "Create Account"

    expect(current_path).to eq('/users')
    expect(page).to have_content("Must fill out all fields/confirm password")
  end
end