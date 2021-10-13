require 'rails_helper'

RSpec.describe 'user registration page' do
  before :each do
    visit registration_path
  end

  it 'creates a new user-happy path' do
    email = "erin@test.com"
    password = "password"

    fill_in 'user[email]', with: email
    fill_in 'user[password]', with: password
    fill_in 'user[password_confirmation]', with: password

    click_on "Create User"

    expect(page).to have_content("Welcome, #{email}!")
  end
end
