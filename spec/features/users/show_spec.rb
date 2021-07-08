require 'rails_helper'

RSpec.describe 'Dashboard page' do
  before :each do
    @user = User.create!(email: 'roald@gmail.com', password_digest: 'test')

    visit root_path

    click_on 'Log me in!'

    fill_in :email, with: @user.email
    fill_in :password, with: @user.password_digest

    click_on 'Log in'

    visit '/dashboard'
  end

 it 'has a welcome message' do
   expect(page).to have_content("Welcome #{user.email}!")
 end

 it 'has a button to discover movies' do
   expect(page).to have_button('Discover Movies')
 end

 it 'shows a message if the user hasnt added any friends' do
   expect(page).to have_content("You currently haven't added any friends.")
 end

 xit 'shows all friends a current user has' do
   user_2 = User.create!(email: 'roald_2@gmail.com', password_digest: 'test')
   expect(page).to have_content(user_2.email)
 end

 xit 'shows all viewing parties user is attending' do
   expect(page).to have_content(party.title)
   expect(page).to have_content(party.start_time)
   expect(page).to have_content(party.date)
   expect(page).to have_content(user_2.email)
   expect(page).to have_content(party)
 end
end
