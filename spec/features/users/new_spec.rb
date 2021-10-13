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
    expect(current_path).to eq(dashboard_path)
  end

  it 'has a sad path if no confirmation is provided' do
    email = "test@test.com"
    password = "passwordd"

    fill_in 'user[email]', with: email
    fill_in 'user[password]', with: password
    fill_in 'user[password_confirmation]', with: '    '
    click_on "Create User"
    expect(page).to have_content("Error: Password confirmation doesn't match Password")
    expect(current_path).to eq(registration_path)
  end

  it 'has a sad path if confirmation does nor match' do
    email = "test@test.com"
    password = "passwordd"
    password_1 = "test"

    fill_in 'user[email]', with: email
    fill_in 'user[password]', with: password
    fill_in 'user[password_confirmation]', with: password_1
    click_on "Create User"
    expect(page).to have_content("Error: Password confirmation doesn't match Password")
    expect(current_path).to eq(registration_path)
  end

  it 'has a sad path if no password is provided' do
    email = "test@test.com"
    password = "passwordd"
    password_1 = "test"

    fill_in 'user[email]', with: email
    fill_in 'user[password]', with: '    '
    fill_in 'user[password_confirmation]', with: password_1
    click_on "Create User"
    expect(page).to have_content("Error: Password confirmation doesn't match Password")
    expect(current_path).to eq(registration_path)
  end

  it 'has a sad path if no email is provided' do
    email = "test@test.com"
    password = "passwordd"
    password_1 = "test"

    fill_in 'user[email]', with: '  '
    fill_in 'user[password]', with: password
    fill_in 'user[password_confirmation]', with: password
    click_on "Create User"
    expect(page).to have_content("Error: Email can't be blank")
    expect(current_path).to eq(registration_path)
  end
end
