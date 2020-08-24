require 'rails_helper'

RSpec.describe 'As a user, when I visit a movie show page' do
  it 'I can create a new viewing party' do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new(
      Faker::Omniauth.google
    )
    visit root_path
    click_button 'Log In with Google'

    visit movies_path(search_terms: 'godfather')
    first('.movie > a').click
    expect(current_path).to eq('/movies/238')

    click_button 'Create Viewing Party'

    expect(current_path).to eq(new_viewing_party_path)

    expect(page).to have_content('The Godfather')
    expect(page).to have_content('Duration of Party')

    expect(page).to have_selector("duration[value=175]")
    fill_in :duration, with: 180
    

  end
end
