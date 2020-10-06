require 'rails_helper'

RSpec.describe 'Welcome Page' do
  it 'should have login, registration, and description' do
    visit root_path

    expect(page).to have_content('Welcome to Viewing Party')
    expect(page).to have_content('This is an app for you and your friends to search for movies and schedule dates and times to watch them together! Six feet apart!')
    expect(page).to have_field(:email)
    expect(page).to have_field(:password)
    expect(page).to have_button('Sign In')
    expect(page).to have_link('Register Here')
  end
end
