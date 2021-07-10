require 'rails_helper'

RSpec.describe 'Dashboard page' do
  before :each do
    @user = User.create!(email: 'roald@gmail.com', password: 'test')

    visit root_path

    click_on 'Log me in!'

    fill_in :email, with: @user.email
    fill_in :password, with: @user.password

    click_on 'Log In'

    visit '/dashboard'
  end

 it 'has a welcome message' do
   expect(page).to have_content("Welcome #{@user.email}!")
 end

 it 'has a button to discover movies' do
   expect(page).to have_button('Discover Movies')
 end

 it 'shows a message if the user hasnt added any friends' do
   expect(page).to have_content("You currently haven't added any friends.")
 end

 it 'shows all friends a current user has' do
   user_2 = User.create!(email: 'roald_2@gmail.com', password_digest: 'test')

   UserFriendship.create!(user: @user, friend: user_2)

   visit '/dashboard'

   expect(page).to have_content(user_2.email)
 end

 it 'has a field to add friends' do
   expect(page).to have_field(:email)
 end

 it 'shows an error when searching for an unregistered user' do
   fill_in :email, with: 'Roald2112@ex.com'

   click_on 'Add Friend'

   expect(current_path).to eq('/dashboard')
   expect(page).to have_content('That user has not yet registered with this platform.')
 end

 it 'shows an error when trying to add a friend already in your friends list' do
   user_2 = User.create!(email: 'roald_2@gmail.com', password_digest: 'test')

   UserFriendship.create!(user: @user, friend: user_2)

   visit '/dashboard'

   fill_in :email, with: user_2.email

   click_on 'Add Friend'

   expect(current_path).to eq('/dashboard')
   expect(page).to have_content('You are already friends with that user')
 end

 xit 'shows all viewing parties user is attending' do
   expect(page).to have_content(party.title)
   expect(page).to have_content(party.start_time)
   expect(page).to have_content(party.date)
   expect(page).to have_content(user_2.email)
   expect(page).to have_content(party)
 end
end
