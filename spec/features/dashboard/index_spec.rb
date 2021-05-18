require 'rails_helper'

RSpec.describe 'Dashboard page' do
  before(:each) do
    @user = User.create(user_name: 'joeyh@test.com', password: 'doyouwanttohearasong')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    @user1 = User.create(user_name: 'joey', password: '123')
    @user2 = User.create(user_name: 'steve', password: '123')
    @user3 = User.create(user_name: 'jeff', password: '123')
    @party1 = Party.create!(movie_title: 'Mortal Kombat', movie_id: 460_465, party_duration: 150, party_date: '2021-06-17',
                            start_time: '19:00', user_id: @user.id, runtime: 120)
    @party2 = Party.create!(movie_title: 'Pokemon', movie_id: 151, party_duration: 150, party_date: '2021-06-17',
                            start_time: '19:00', user_id: @user1.id, runtime: 120)
    @user.parties << @party1
    @user1.parties << @party1
    @user2.parties << @party1
    @user.parties << @party2
    @user3.parties << @party2
  end
  describe 'when a logged in user visits the dashboard index path' do
    it 'displays a welcome message, button to discover movies, friends section and viewing parties section' do
      user = User.create(user_name: 'joeyh@test.com', password: 'doyouwanttohearasong')
      visit root_path
      click_button 'Log in'
      expect(current_path).to eq(login_path)

      fill_in :user_name, with: 'joeyh@test.com'
      fill_in :password, with: 'doyouwanttohearasong'
      click_button 'Log in'

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content('Welcome joeyh@test.com!')
      expect(page).to have_button('Discover Movies')
      expect(page).to have_content('Friends List')
      expect(page).to have_content('Viewing Parties List')
    end
  end
  describe 'when a logged in user visits the dashboard they can use the Search and Add friend feature' do
    it 'displays a search form to add friends' do
      visit dashboard_path

      expect(page).to have_field('search')
    end
    it 'Add Friend Happy Path' do
      visit dashboard_path
      fill_in :search, with: 'steve'
      click_button 'Add Friend'

      expect(page).to have_content('steve')
    end
    it 'Add Friend Sad Path' do
      visit dashboard_path
      fill_in :search, with: 'banana'
      click_button 'Add Friend'
      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content('No user found')
    end
    it 'Add Yourself Sad Path' do
      visit dashboard_path
      fill_in :search, with: @user.user_name
      click_button 'Add Friend'
      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("That's you silly")
    end
    it 'Add Same Friend Sad Path' do
      @user.friends << @user2

      visit dashboard_path
      fill_in :search, with: @user2.user_name
      click_button 'Add Friend'
      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content('You are already friends')
    end
  end
  describe 'when a logged in user visits the dashboard they can see the parties they are invited to or hosting' do
    it 'shows parties with all details included' do
      visit dashboard_path

      within "#party-#{@party1.id}" do
        expect(page).to have_content(@party1.movie_title)
        expect(page).to have_link('Mortal Kombat', href: '/discover/movies/460465')
        expect(page).to have_content(@party1.party_date.strftime('%A, %B %e %Y'))
        expect(page).to have_content(@party1.start_time.strftime('%l %M'))
        expect(page).to have_content(@party1.host_name)
        expect(page).to have_content('Hosting')
      end
      within "#party-#{@party1.id}-#{@user1.id}" do
        expect(page).to have_content(@user1.user_name)
      end
      within "#party-#{@party1.id}-#{@user2.id}" do
        expect(page).to have_content(@user2.user_name)
      end
      within "#party-#{@party1.id}-#{@user.id}" do
        expect(page).to have_content('')
      end
      within "#party-#{@party2.id}" do
        expect(page).to have_content(@party2.movie_title)
        expect(page).to have_link('Pokemon', href: '/discover/movies/151')
        expect(page).to have_content(@party2.party_date.strftime('%A, %B %e %Y'))
        expect(page).to have_content(@party2.start_time.strftime('%l %M'))
        expect(page).to have_content(@party2.host_name)
        expect(page).to have_content('Invited')
      end
      within "#party-#{@party2.id}-#{@user3.id}" do
        expect(page).to have_content(@user3.user_name)
      end
      within "#party-#{@party2.id}-#{@user.id}" do
        expect(page).to have_content(@user.user_name)
      end
    end
  end
end
