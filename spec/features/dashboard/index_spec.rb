require 'rails_helper'

describe 'user dashboard' do
  before(:each) do
    @user1 = create(:user)
    @user2 = create(:user)
    @user3 = create(:user)

    Friendship.create(user: @user1, friend: @user2)
    Friendship.create(user: @user1, friend: @user3)

    visit root_path
  end

  it 'shows a welcome message, Discover button, Friends, and Parties sections for authenticated user' do
    click_link 'Log In'

    fill_in :email, with: @user1.email
    fill_in :password, with: @user1.password

    click_button 'Log In'


    visit dashboard_path

    expect(page).to have_content("Welcome #{@user1.username}!")
    expect(page).to have_link("Discover Movies")
    expect(page).to have_content("Friends")
    expect(page).to have_content(@user2.username)
    expect(page).to have_content(@user3.username)
    expect(page).to have_content("Parties")
  end

  it 'shows error flash message for unauthenticated user' do
    visit dashboard_path

    expect(page).to have_content("You need to log in to view your dashboard buddy")

    end
end
