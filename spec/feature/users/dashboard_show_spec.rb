require 'rails_helper'

RSpec.describe 'user dashboard' do
  it 'as a user, after logging in, I see a welcome message with my username, along with a discover movies section, a friends section, and a viewing parties section' do
    visit '/'
    @user = User.create!(username: "eDog", email: "elah@email.com", password: "password")
    click_button("Login")

    expect(current_path).to eq("/login")

    fill_in :email, with: @user.email
    fill_in :password, with: @user.password

    click_button("Login")

    expect(current_path).to eq("/dashboard")

    expect(page).to have_content("Welcome #{@user.username}")
    expect(page).to have_button('Discover Movies')
    expect(page).to have_content('Check Out Yo Friends')
    expect(page).to have_content('Check Out Yo Viewing Parties')
  end

  it 'as a user, I see a text field to enter a friends email, and a button to Add Friend' do
    @user1 = User.create!(username: "eDog", email: "elah@email.com", password: "password")
    @user2 = User.create(username: "eCat", email: "ecat@email.com", password: "cats")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)

    visit '/dashboard'

    expect(page).to have_content('Check Out Yo Friends')
    expect(page).to have_field('Email')
    expect(page).to have_button('Add Friend')
  end

  it 'as a user, I see a message when I do not have any friends' do
    @user1 = User.create!(username: "eDog", email: "elah@email.com", password: "password")
    @user2 = User.create(username: "eCat", email: "ecat@email.com", password: "cats")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)

    visit '/dashboard'

    expect(page).to have_content("You currently have no friends.")
  end

  it 'as a user, I see a message when I have added friends' do
    @user1 = User.create!(username: "eDog", email: "elah@email.com", password: "password")
    @user2 = User.create!(username: "eCat", email: "ecat@email.com", password: "cats")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)

    visit '/dashboard'
    fill_in :email, with: "#{@user2.email}"
    click_button 'Add Friend'

    expect(page).to have_content("#{@user2.username}")
  end

  it 'displays an error message when an email is added that does not belong to a registered user' do
    @user1 = User.create!(username: "eDog", email: "elah@email.com", password: "password")
    @user2 = User.create!(username: "eCat", email: "ecat@email.com", password: "cats")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)

    visit '/dashboard'
    fill_in :email, with: "s@gmail.com"
    click_button 'Add Friend'

    expect(page).to have_content("Sorry, friend cannot be found")
  end
end
