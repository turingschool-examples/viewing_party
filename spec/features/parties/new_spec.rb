require 'rails_helper'

describe 'New Viewing Party Page' do
  before :each do
    @user = User.create(user_name: 'joeyh@test.com', password: 'doyouwanttohearasong')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    
    @friend_1 = User.create(user_name: 'klaudia@test.com', password: 'hotsprings')
    @friend_2 = User.create(user_name: 'keegan@test.com', password: 'extrapeppermint')
    @friend_3 = User.create(user_name: 'kseniya@test.com', password: 'catsss') # don't add
    @user.friends << @friend_1
    @user.friends << @friend_2
    
    visit discover_movies_path
    click_button 'Discover Top 40 Movies'
    click_link 'Mortal Kombat'
    click_button 'Create a New Party'
    
  end
  it 'displays movie title form field and button to create party', :vcr do
    expect(page).to have_content('Create a New Viewing Party for Mortal Kombat')
    expect(page).to have_field(:party_duration, with: 110)
    expect(page).to have_field(:party_date)
    expect(page).to have_field(:start_time)
    expect(page).to have_content('Invite Friends')
    expect(page).to have_field('klaudia@test.com')
    expect(page).to have_field('keegan@test.com')
    expect(page).to have_button('Create Viewing Party')
  end

  it 'HAPPY PATH - User should be able to fill in a form and create a new party', :vcr do
    fill_in :party_duration, with: 130
    fill_in :party_date, with: '2021-06-17'
    fill_in :start_time, with: '19:00'
    check 'klaudia@test.com'
    save_and_open_page
    click_button 'Create Viewing Party'

    expect(current_path).to eq(dashboard_path)
    # expect(page).to have_content('klaudia@test.com')
    # expect(page).to_not have_content('keegan@test.com')
    # expect(page).to have_content('Mortal Kombat Party on June 17, 2021')
  end

  it 'SAD PATH - displays a message to the user if the new party was not saved', :vcr do
    fill_in :party_duration, with: ''
    fill_in :party_date, with: ''
    fill_in :start_time, with: ''

    click_button 'Create Viewing Party'

    expect(page).to have_content('Mortal Kombat')
    expect(page).to have_field(:party_duration, with: 110)
    expect(page).to have_content('Party was not saved. Try again.')
  end
end
