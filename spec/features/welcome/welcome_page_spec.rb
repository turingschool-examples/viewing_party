require 'rails_helper'

RSpec.describe 'welcome index page' do
  before :each do
    visit root_path
  end
  it 'can display the welcome and introduction message' do
    expect(page).to have_content('Welcome to Viewing Party!')
    expect(page).to have_content('This is an application where you can create and manage viewing parties with your friends. Simply log in and head to the discover page, where you will find the best movie for you and your friends to enjoy!')
  end

  it 'can display a button to log in' do
    expect(page).to have_link('Log In')
  end

  it 'can display a link to register' do
    expect(page).to have_link('Create an Account')
  end

  it 'links the users to log-in' do
    user = User.create!(email: 'test@test.com', password: 'password123', password_confirmation: 'password123')

    click_on 'Log In'
    expect(current_path).to eq(login_path)
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_on 'Submit'
    expect(page).to have_content("Welcome, #{user.email}")
    expect(current_path).to eq(dashboard_path)


  end
  it 'links user to register' do
    visit root_path
    click_on 'Create an Account'
    expect(current_path).to eq(registration_path)
  end
end
