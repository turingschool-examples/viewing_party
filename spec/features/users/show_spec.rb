require 'rails_helper'

RSpec.describe 'The User dashboard' do
  before :each do
    @user = User.create(email: 'test@test.com', password: 'password123', password_confirmation: 'password123')
    @party = @user.events.create(title: 'Harry Potter and The Chamber of Secrets', date: "2021-10-10", time: '8:00:00', runtime: 90, user_id: @user.id)
    @user_1 = User.create(email: 'test1@test.com', password: 'password1234', password_confirmation: 'password1234')
    @friendship = Friendship.create(follower_id:@user.id, followee_id:@user_1.id)
    @attendees =  Attendee.create(user_id:@user_1.id, event_id:@party.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit dashboard_path

  end

  it 'has a welcome message' do
    expect(page).to have_content("Welcome, #{@user.email}!")
  end

  it 'has a button to discover movies' do
    expect(page).to have_button('Discover Movies')
    click_button 'Discover Movies'
    expect(current_path).to eq(discover_path)
  end

  it 'has a viewing party section thst shows parties I have created' do
    #note once new viewing party page has been created this will need to be updated
    expect(page).to have_content(@party.title)
    expect(page).to have_content(@party.date)
    expect(page).to have_content(@party.time)
    expect(page).to have_content(@attendees.user.email)
    expect(page).to have_content('Hosting')
  end
end
