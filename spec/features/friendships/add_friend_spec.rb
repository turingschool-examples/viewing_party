require 'rails_helper'

RSpec.describe 'User dashboard', type: :feature do
  describe 'As an authenticated user' do
    it 'I can add a new friend' do
        user = create :user
        friend = create :user
        visit '/'
        fill_in 'Email', with: user.email
        fill_in 'Password', with: user.password
        click_on 'Log in'
        fill_in 'Email', with: friend.email
        click_button 'Add New Friend'
        expect(user.friends).to eq([friend])
        within "#friends" do
            expect(page).to have_content("#{friend.email}")
        end
    end
    it 'I cant add self a new friend' do
        user = create :user
        friend = create :user
        visit '/'
        fill_in 'Email', with: user.email
        fill_in 'Password', with: user.password
        click_on 'Log in'
        fill_in 'Email', with: user.email
        click_button 'Add New Friend'
        expect(user.friends).to eq([])
        expect(page).to have_content("Friend can't be yourself!")
    end
    it 'I cant add a non-existent user' do
        user = create :user
        visit '/'
        fill_in 'Email', with: user.email
        fill_in 'Password', with: user.password
        click_on 'Log in'
        fill_in 'Email', with: "asdf@fdsa.com"
        click_button 'Add New Friend'
        expect(user.friends).to eq([])
        expect(page).to have_content("Can't find user with that email!")
    end
    it 'I cant add a friend that I already added' do
        user = create :user
        friend = create :user
        visit '/'
        fill_in 'Email', with: user.email
        fill_in 'Password', with: user.password
        click_on 'Log in'
        fill_in 'Email', with: friend.email
        click_button 'Add New Friend'
        expect(user.friends).to eq([friend])
        fill_in 'Email', with: friend.email
        click_button 'Add New Friend'
        expect(page).to have_content("You've already added #{friend.email} as a friend!")
    end
  end
end