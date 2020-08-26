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
    friend = User.create(uid: '999999', access_token: 'shdfjsadhflsjdhf', email: 'jane@email.com', refresh_token: '2394809348')
    Friendship.create(user_id: user.id, friend_id: friend.id)
    Friendship.create(user_id: friend.id, friend_id: user.id)

    visit movies_path(search_terms: 'godfather')
    first('.movie > a').click
    expect(current_path).to eq('/movies/238')

    click_button 'Create Viewing Party'

    expect(current_path).to eq(new_view_party_path)

    expect(page).to have_content('The Godfather')
    expect(page).to have_content('Duration of Party')

    expect(find_field(:duration).value).to eq('175')
    fill_in :duration, with: '180'

    expect(page).to have_content(friend.email)
    check('jane@email.com')
    fill_in :date, with: '2020-12-12'
    fill_in :time, with: '20:00'
    click_button 'Create Party'
    new_party = ViewParty.last
    expect(new_party.title).to eq('The Godfather')
    expect(new_party.duration).to eq(180)
    expect(new_party.poster).to eq('https://image.tmdb.org/t/p/w185/iVZ3JAcAjmguGPnRNfWFOtLHOuY.jpg')
    expect(new_party.date).to eq('2020-12-12')
    expect(new_party.time).to eq('20:00')
    guests = PartyGuest.last
    expect(guests.view_party_id).to eq(new_party.id)
    expect(guests.user_id).to eq(friend.id)

    expect(current_path).to eq(dashboard_path)

    within '.viewing-parties' do
      expect(page).to have_content('The Godfather')
      expect(page).to have_content('2020-12-12')
      expect(page).to have_content('20:00')
      expect(page).to have_css("img[src*='https://image.tmdb.org/t/p/w185/iVZ3JAcAjmguGPnRNfWFOtLHOuY.jpg']")
    end
    party = ViewParty.create(title: 'Jack Reacher', duration: 118, date: '2020-12-08', time: '21:00', poster: 'https://image.tmdb.org/t/p/w185/7baSUtFKi8PQ9SLo6ECYBfAW2K8.jpg', user_id: friend.id)
    PartyGuest.create(view_party_id: party.id, user_id:user.id)

    visit dashboard_path
    within '.viewing-parties' do
      expect(page).to have_content('Jack Reacher')
      expect(page).to have_content('2020-12-08')
      expect(page).to have_content('21:00')
      expect(page).to have_css("img[src*='https://image.tmdb.org/t/p/w185/7baSUtFKi8PQ9SLo6ECYBfAW2K8.jpg']")
    end
  end
end
