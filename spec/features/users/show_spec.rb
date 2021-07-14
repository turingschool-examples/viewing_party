require 'rails_helper'

RSpec.describe 'Dashboard page' do
  before :each do
    @user_1 = User.create!(email: 'roald@gmail.com', password: 'test')
    @user_2 = User.create!(email: 'empanada_luvr@email.com', password: 'hocuspocus')
    @user_3 = User.create!(email: 'cheese_luvr@email.com', password: 'password')
    @user_4 = User.create!(email: 'cat_luvr@email.com', password: 'catz')

    @friendship_1 = UserFriendship.create(user_id: @user_1.id, friend_id: @user_2.id)
    @friendship_2 = UserFriendship.create(user_id: @user_3.id, friend_id: @user_2.id)
    @friendship_3 = UserFriendship.create(user_id: @user_4.id, friend_id: @user_2.id)

    @party_1 = Party.create(party_host_id: @user_2.id, movie_title: 'Mrs. Doubtfire', date: '2021-09-14', duration: 122, start_time: "13:00:00")

    @attendee_1 = Attendee.create(party_id: @party_1.id, user_id: @user_1.id)
    @attendee_2 = Attendee.create(party_id: @party_1.id, user_id: @user_3.id)
    @attendee_3 = Attendee.create(party_id: @party_1.id, user_id: @user_4.id)

    @party_2 = Party.create(party_host_id: @user_1.id, movie_title: 'Titanic', date: '2021-08-04', duration: 100000, start_time: "12:00:00")
    @attendee_4 = Attendee.create(party_id: @party_2.id, user_id: @user_2.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user_2)
#
    visit '/dashboard'
  end

  xit 'has a welcome message' do
   expect(page).to have_content("Welcome #{@user_2.email}!")
  end

   it 'has a button to discover movies' do
     expect(page).to have_button('Discover Movies')
   end

   it 'shows a message if the user hasnt added any friends' do
     expect(page).to have_content("You currently haven't added any friends.")
   end

   it 'shows all friends a current user has' do
     expect(page).to have_content(@user_2.email)
   end

   it 'has viewing party details' do
     expect(page).to have_content('Viewing Parties')
     expect(page).to have_content('Viewing Parties you are invited to:')
     expect(page).to have_content('Viewing Parties You are Hosting:')
   end

   it 'has a section for parties user has been invited to' do
     within("#invited") do
       expect(page).to have_link(@party_2.movie_title) #placeholder until API   expect(page).to have_content(party.date)
       expect(page).to have_content("Host: #{@user_1.email}")
       expect(page).to have_content(@party_2.date)
       expect(page).to have_content(@party_2.start_time)
       # save_and_open_page
       # expect(page).to have_content("Invited Attendees: #{@user_2.email} ")
       # page.html.should include('this is <b>bold</b> "roald_2@gmail.com"')
       # click_link(@party_2.movie_title)
       # expect(current_path).to eq(movie_details_path)
     end
   end

   it 'displays all viewing parties that use is hosting' do
     within("#hosting") do
       expect(page).to have_link(@party_1.movie_title)
       expect(page).to have_content(@party_1.date)
       expect(page).to have_content(@party_1.start_time)
       #add assertion for attendees once that functionality is incorporated
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

# <% if current_user.parties.count > 0 %>
#   <% current_user.parties.each do |party| %>
#     <%= link_to "#{party.movie_title}", url: "/movies/#{party.movie_id}", method: :get, local: true %>
#     <p>Start Time: <%= party.start_time %><p>
#     <p>Host: <%= current_user.email %></p>
#     <p>Attendees: </p>
#     <% party.attendees.each do |attendee| %>
#       <% if attendee.email == current_user.email %>
#         <b><%= attendee.email %></b>
#       <% else %>
#         <%= attendee.email %>
