require 'rails_helper'

RSpec.describe 'Dashboard page' do
  before(:each) do
    user = User.create(user_name: 'joeyh@test.com', password: 'doyouwanttohearasong')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    @user1 = User.create(user_name: 'joey', password: '123')
    @user2 = User.create(user_name: 'steve', password: '123')
    @user3 = User.create(user_name: 'jeff', password: '123')
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

      expect(page).to have_field('search')
    end
  end
end
