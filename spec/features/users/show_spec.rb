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

 it 'has viewing party sections' do
   expect(page).to have_content('Viewing Parties')
   expect(page).to have_content('Parties you have been invited to attend')
   expect(page).to have_content('You as party host - Your Parties')
 end
 # I should see the viewing parties I have been invited to with the following details:
 it 'shows all viewing parties user is attending' do
   party = ViewingParty.create!(movie_title: 'Mrs. Doubtfire', date: '2021-09-14', duration: 122, start_time: "13:00:00"  )
   expect(page).to have_link(party.movie_title) #placeholder until API   expect(page).to have_content(party.date)
   expect(page).to have_content(party.duration)
   expect(page).to have_content(party.start_time)
 end

 it 'displays movie title with link to movie show page' do
   click_link(party.movie_title)
   expect(current_path).to eq(movie_details_path)
 end

 it 'lists friends invited, with user name in bold' do

 end
end

 describe "viewing parties with user as the host" do
   it 'displays movie title, which links to the movie show page' do
   end

   it 'displays date and time of parties with the user as host of the event' do
   end

   it 'lists friends invited to the viewing party' do
   end
 end
end

# As an authenticated user,
# I should see the viewing parties I have been invited to with the following details:
# -- invited to --
# Movie Title, which links to the movie show page
# Date and Time of Event
# who is hosting the event
# list of friends invited, with my name in bold
# I should also see the viewing parties that I have created with the following details:
#-- party_host --
# Movie Title, which links to the movie show page
# Date and Time of Event
# That I am the host of the party
# List of friends invited to the viewing party
