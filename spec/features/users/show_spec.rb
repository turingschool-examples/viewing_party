require 'rails_helper'

RSpec.describe 'Dashboard Page' do
  describe 'when I visit my dashboard' do
    it 'I see a button to Discover Movies' do
      visit '/login'
      email = "example@example.com"
      password = "test"
      user = User.create!(email: email, password: password)

      fill_in :email, with: email
      fill_in :password, with: password
      click_button "Log In"

      expect(current_path).to eq('/dashboard')
      expect(page).to have_button('Discover Movies')
    end

    it 'Discover Movies button redirects me to Discover Page' do
      visit '/login'
      email = "example@example.com"
      password = "test"
      user = User.create!(email: email, password: password)

      fill_in :email, with: email
      fill_in :password, with: password
      click_button "Log In"
      click_button "Discover Movies"

      expect(current_path).to eq('/discover')
    end

    describe 'I can add friends' do
      it 'by entering their email address and clicking add friend' do
        new_friend = User.create!(email: 'world@email.com', password: "hello")

        visit '/login'
        email = "example@example.com"
        password = "test"
        user = User.create!(email: email, password: password)

        fill_in :email, with: email
        fill_in :password, with: password
        click_button "Log In"

        expect(page).to have_content("You currently have no friends")
        expect(page).to_not have_content(new_friend.email)

        fill_in :email, with: new_friend.email
        click_button "Add Friend"

        expect(page).to have_content(new_friend.email)
        expect(page).to_not have_content("You currently have no friends")
      end
    end
  end

  describe 'sad path and edge case' do
    it 'shows non-authorized message for dashboard path' do
      visit '/dashboard'

      not_authorized = "You must be logged in to view your dashboard"

      expect(current_path).to eq('/')
      expect(page).to have_content(not_authorized)
    end

    it 'show message when adding friend that does not exist' do
      visit '/login'
      email = "example@example.com"
      password = "test"
      user = User.create!(email: email, password: password)

      fill_in :email, with: email
      fill_in :password, with: password
      click_button "Log In"

      fill_in :email, with: 'dontexist@email.com'
      click_button "Add Friend"

      message = 'That user does not exist'
      expect(page).to have_content(message)
    end
  end

  describe 'viewing parties' do
    it 'can create a viewing party and add a friend' do
      friend = User.create!(email: 'world@email.com', password: "hello")
      other_friend = User.create!(email: 'unicorn@email.com', password: "hi")

      visit '/login'
      email = "example@example.com"
      password = "test"
      user = User.create!(email: email, password: password)

      Friendship.create!(user_id: user.id, friend_id: friend.id)
      Friendship.create!(user_id: user.id, friend_id: other_friend.id)

      fill_in :email, with: email
      fill_in :password, with: password
      click_button "Log In"

      visit '/movies/556574'

      click_button 'Create Viewing Party for Movie'

      fill_in :date, with: '2021-05-17'
      fill_in :start_time, with: '07:00 PM'
      within("#friend-#{friend.id}") do
        check "#{friend.email}"
      end
      click_button 'Create Party'

      expect(page).to have_link('Hamilton', href: '/movies/556574')
      expect(page).to have_content('2021-05-17')
      expect(page).to have_content("07:00 PM")
      expect(page).to have_content("Host: #{user.email}")
      within("#party-#{user.parties.first.id}") do
        expect(page).to have_content(friend.email)
        expect(page).to_not have_content(other_friend.email)
      end
    end
  end
end
