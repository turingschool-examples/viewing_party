require 'rails_helper'

RSpec.describe 'User Dashboard Page', type: :feature do
  before :each do
    @user = create(:mock_user)
    @friend_1 = create(:mock_user)
    @friend_2 = create(:mock_user)
    # @friendship_2 = create(:mock_friendship, user: @user, friend: @friend_2)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  describe 'friendships' do
    context 'has no friends to display' do
      it 'displays no friends if no friends' do
        visit dashboard_path

        within('#friends') do
          expect(page).to have_content("You currently have no friends")
        end
      end
    end

    context 'has friends to display' do
      it 'displays friend names' do
        friendship_1 = create(:mock_friendship, user: @user, friend: @friend_1)

        visit dashboard_path

        within('#friends') do
          expect(page).to have_content(@friend_1.full_name)
          expect(page).to_not have_content(@friend_2.full_name)
        end
      end
    end

    context 'add friends by email' do
      before(:each) do
        visit dashboard_path
      end
      it 'has form to add friend' do

        within('#friends') do
          expect(page).to have_field('friendship[friend_email]')
          expect(page).to have_button('Add Friend')
        end
      end
      it 'adds friends by email' do

        within('#friends') do
          expect(page).to have_content("You currently have no friends")

          fill_in 'friendship[friend_email]', with: @friend_1.email
          click_on 'Add Friend'
        end
        expect(current_path).to eq(dashboard_path)

        expect(page).to have_content("#{@friend_1.full_name} is now your friend")

        within('#friends') do
          expect(page).to have_content(@friend_1.full_name)
        end
      end

      it 'will not add users without correct email' do

        within('#friends') do
          expect(page).to have_content("You currently have no friends")

          fill_in 'friendship[friend_email]', with: 'not_real@fake.com'
          click_on 'Add Friend'
        end
        expect(current_path).to eq(dashboard_path)

        expect(page).to have_content('Sorry, no user exists by that email.')
        within('#friends') do
          expect(page).to have_content("You currently have no friends")
        end
      end

      it 'will not let user add self' do

        within('#friends') do
          expect(page).to have_content("You currently have no friends")

          fill_in 'friendship[friend_email]', with: @user.email
          click_on 'Add Friend'
        end
        expect(current_path).to eq(dashboard_path)

        expect(page).to have_content('You cannot add yourself as a friend.')

        within('#friends') do
          expect(page).to have_content("You currently have no friends")
        end
      end

      it 'will not add duplicate friends' do
        @user.friends << @friend_1
        visit dashboard_path

        within('#friends') do
          fill_in 'friendship[friend_email]', with: @friend_1.email
          click_on 'Add Friend'
        end
        expect(current_path).to eq(dashboard_path)
        expect(page).to have_content("#{@friend_1.full_name} is already your friend.")
      end
    end
  end

  describe 'User dashboard has viewing parties' do
    it 'shows viewing parties that user is hosting', :vcr do
      movie = MovieFacade.movie_info_by_id(337404)

      party = create(:mock_party, movie_title: movie.title, movie_id: movie.id)
      attendee_host = create(:mock_attendee, party_id: party.id, user_id: @user.id, status: 0)
      attendee = create(:mock_attendee, party: party, user: @friend_1, status: 1)
      visit dashboard_path
      within("#party-#{party.id}") do
        expect(page).to have_content(party.movie_title)
        expect(page).to have_content(party.date.strftime("%B %d, %Y"))
        expect(page).to have_content(party.time.strftime("%l:%M %p"))
        expect(page).to have_content("You are the host")
        expect(page).to have_content(@friend_1.full_name)
      end
    end


    it 'shows viewing parties that user is invited to', :vcr do
      movie = MovieFacade.movie_info_by_id(155)

      party = create(:mock_party, movie_id: movie.id, movie_title: movie.title)
      attendee_host = create(:mock_attendee, party: party, user: @friend_1)
      attendee_1 = create(:mock_attendee, party: party, user: @user, status: 1)
      attendee_2 = create(:mock_attendee, party: party, user: @friend_2, status: 1)
      visit dashboard_path

      within("#party-#{party.id}") do
        expect(page).to have_content(movie.title)
        expect(page).to have_content(party.date.strftime("%B %d, %Y"))
        expect(page).to have_content(party.time.strftime("%l:%M %p"))
        within('#party-host') do
          expect(page).to have_content("Host: #{@friend_1.full_name}")
        end
        within('#party-invited') do
          expect(page).to have_content(@user.full_name)
          expect(page).to have_content(@friend_2.full_name)
        end
      end
    end
  end
end
