require 'rails_helper'

RSpec.describe 'As a user, when I visit a movie show page' do
  it 'I can create a new viewing party' do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new(
      Faker::Omniauth.google
    )
    visit root_path
    click_button 'Log In with Google'
    user = User.last
    friend = User.create(uid: '999999', access_token: 'shdfjsadhflsjdhf', name: 'Jane Greene', email: 'jane@email.com')
    Friendship.create(user_id: user.id, friend_id: friend.id)
    Friendship.create(user_id: friend.id, friend_id: user.id)

    visit movies_path(search_terms: 'godfather')
    first('.movie > a').click
    expect(current_path).to eq('/movies/238')

    click_button 'Create Viewing Party'

    expect(current_path).to eq(new_viewing_party_path)

    expect(page).to have_content('The Godfather')
    expect(page).to have_content('Duration of Party')

    expect(find_field(:duration).value).to eq('175')
    fill_in :duration, with: '180'

    expect(page).to have_content(friend.name)
    check('Jane Greene')
    fill_in :date, with: '2020-12-12'
    fill_in :time, with: '20:00'
    click_button 'Create Party'
    new_party = ViewingParties.last
    expect(new_party.title).to eq('The Godfather')
    expect(new_party.duration).to eq('180')
    expect(new_party.poster).to eq('/iVZ3JAcAjmguGPnRNfWFOtLHOuY.jpg')
    expect(new_party.date).to eq('2020-12-12/20:00')
    guests = UserParty.last
    expect(guests.viewing_party_id).to eq(new_party.id)
    expect(guests.user_id).to eq(friend.id)
  end
end
