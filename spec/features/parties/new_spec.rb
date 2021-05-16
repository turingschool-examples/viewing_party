require 'rails_helper'

describe 'New Viewing Party Page' do
  before :each do
    user = User.create(user_name: 'joeyh@test.com', password: 'doyouwanttohearasong')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit discover_movies_path
    click_button 'Discover Top 40 Movies'
    click_link 'Mortal Kombat'
    click_button 'Create a New Party'
    # create two more users
    # User adds one of the other two
  end
  it 'for an authenticated user, it should display the movie title rendered above a form with fields for: Duration of Party with a default value of movie runtime in minutes, When: field to select date, Start Time: field to select time, Checkboxes next to each friend (if user has friends), Button to create a party' do
    expect(page).to have_content('Create a New Viewing Party for Mortal Kombat')
    expect(page).to have_field(:viewing_party_duration, with: 110)
    expect(page).to have_field(:viewing_party_date)
    expect(page).to have_field(:start_time)
    expect(page).to have_button('Create Viewing Party')
  end

  it 'HAPPY PATH - User should be able to fill in a form and create a new party' do
    fill_in :viewing_party_duration, with: 130
    fill_in :viewing_party_date, with: '2021-06-17'
    fill_in :start_time, with: '19:00'
    # Look up checkboxes

    click_button 'Create Viewing Party'

    expect(current_path).to eq(dashboard_path)
    # expect(page).to have_content('Mortal Kombat Party on June 17, 2021')
  end

  it 'SAD PATH - displays a message to the user if the new party was not saved' do
    fill_in :viewing_party_duration, with: ''
    fill_in :viewing_party_date, with: ''
    fill_in :start_time, with: ''
    # Look up checkboxes

    click_button 'Create Viewing Party'

    expect(page).to have_content('Mortal Kombat')
    expect(page).to have_field(:viewing_party_duration, with: 110)
    expect(page).to have_content('Party was not saved. Try again.')
  end
end
