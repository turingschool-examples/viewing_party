require 'rails_helper'

RSpec.describe 'As a visitor, when I visit the welcome page' do
  it 'I can log in using my Google account information' do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new(
      Faker::Omniauth.google
    )

    visit '/'

    click_button 'Log In with Google'

    user = User.last

    expect(current_path).to eq('/dashboard')
    expect(page).to have_content("Welcome, #{user.email}!")
  end

  it 'and provide incorrect login information, I am redirected to the welcome page' do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2] = :invalid_credentials

    visit '/'

    click_button 'Log In with Google'

    expect(current_path).to eq('/')
  end
end
