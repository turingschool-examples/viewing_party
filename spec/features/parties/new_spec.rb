require 'rails_helper'

RSpec.describe 'New Party Page' do
  before :each do
    @friend = User.create!(email: 'world@email.com', password: "hello")
    @other_friend = User.create!(email: 'unicorn@email.com', password: "hi")

    visit '/login'
    email = "example@example.com"
    password = "test"
    @user = User.create!(email: email, password: password)

    Friendship.create!(user_id: @user.id, friend_id: @friend.id)
    Friendship.create!(user_id: @user.id, friend_id: @other_friend.id)

    fill_in :email, with: email
    fill_in :password, with: password
    click_button "Log In"
  end

  it 'displays movie title and party form' do
    VCR.use_cassette('hamilton_details') do

      visit '/movies/556574'
      click_button 'Create Viewing Party for Movie'

      expect(page).to have_content("Hamilton")
      expect(page).to have_field(:duration, with: "160")
      expect(page).to have_field(:date)
      expect(page).to have_field(:start_time)
      expect(page).to have_unchecked_field("#{@user.friends.first.email}")

      within("#friend-#{@friend.id}") do
        check "#{@friend.email}"
      end
      fill_in :date, with: '2021-05-16'
      fill_in :start_time, with: '07:00 PM'
      click_button 'Create Party'
      expect(current_path).to eq('/dashboard')
    end
  end

  describe 'sad paths and edge cases' do
    it 'displays message when user has no friends' do
      VCR.use_cassette('hamilton_details') do
        Friendship.destroy_all

        visit '/movies/556574'
        click_button 'Create Viewing Party for Movie'

        fill_in :date, with: '2021-05-16'
        fill_in :start_time, with: '07:00 PM'

        message = 'Seems like you have not added friends yet. Just a heads up that you will not be able to modify this event once it has been created.'
        expect(page).to have_content(message)

        click_button 'Create Party'

        expect(current_path).to eq('/dashboard')
      end
    end
  end
end
