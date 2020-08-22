require 'rails_helper'

RSpec.describe 'As a user, I can input search terms for movies' do
  it 'from the discover page' do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new(
      Faker::Omniauth.google
    )

    visit root_path

    click_button 'Log In with Google'

    visit discover_path

    fill_in :keywords, with: 'the river'

    click_button 'Find Movies'

    expect(current_path).to eq(movies_path)

    expect(page).to have_selector('.movie', count: 40)
  end
end
