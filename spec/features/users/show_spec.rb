require 'rails_helper'

RSpec.describe 'The User dashboard' do
  before :each do
    @user = User.create!(email: 'test@test.com', password: 'password123', password_confirmation: 'password123')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    @party = Event.create!(title: 'Harry Potter and The Chamber of Secrets', date: "2021-10-10", time: '8:00:00', runtime: 90, user_id: @user.id)
    @user_1 = User.create!(email: 'test1@test.com', password: 'password1234', password_confirmation: 'password1234')
    @friendship = Friendship.create!(follower_id:@user_1.id, followee_id:@user.id)
    @attendees =  Attendee.create!(user_id:@user_1.id, event_id:@party.id)

    visit dashboard_path
  end

  it 'has a welcome message' do
    expect(page).to have_content("Welcome, #{@user.email}!")
  end

  it 'has a button to discover movies' do
    expect(page).to have_button('Discover Movies')
    click_button 'Discover Movies'
    expect(current_path).to eq(movies_path)
  end

  it 'has a viewing party section thst shows parties I have created' do
    #note once new viewing party page has been created this will need to be updated

  end
end
