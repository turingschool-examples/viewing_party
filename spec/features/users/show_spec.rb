require 'rails_helper'
<<<<<<< HEAD

RSpec.describe 'User Dashboard Page' do
  before :each do
    @user = create(:mock_user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    visit dashboard_path
  end

  describe 'User dashboard has viewing parties' do
    xit 'shows viewing parties that user is hosting' do

      click_link "Log Out"

      User.destroy_all
      movie = VCR.use_cassette("movie_info_by_id") do
        MovieFacade.movie_info_by_id(337404)
      end

      user = create(:mock_user, password: 'hello')
      friend = create(:mock_user)
      user.friends << friend

      party = create(:mock_party)
      user.parties << party

      attendees = create(:mock_attendee, party_id: party.id, attendee: friend)

      fill_in :first_name, with: user.first_name
      fill_in :last_name, with: user.last_name
      fill_in :email, with: user.email
      fill_in :password, with: user.password

      click_on "Sign In"

      expect(page).to have_content("Parties You're Hosting:")
      expect(page).to have_content(party.title)
      expect(page).to have_content(party.date.strftime("%B %d, %Y"))
      expect(page).to have_content(party.time.strftime("%l:%M %p"))
      expect(page).to have_content(friend.full_name)
      expect(page).to have_content(friend.email)
     end
   end

   xit 'shows viewing parties that user is invited to' do

      click_link("Log Out")

      User.destroy_all
      movie = VCR.use_cassette("movie_info_by_id") do
        MovieFacade.movie_info_by_id(337404)
      end
      user = create(:mock_user, password: 'hello')
      friend = create(:mock_user)
      friend.friends << user
      party = create(:mock_party, host_id: friend.id, movie_id: movie.id, title: movie.title)
      party_guests = create(:mock_party_guest, party_id: party.id, guest: user )

      # user.friends << friend
      # party = create(:mock_party, host_id: user.id, movie_id: movie.id, title: movie.title)
      # party_guests = create(:mock_party_guest, party_id: party.id, guest: friend )

      fill_in :email, with: user.email
      fill_in :password, with: user.password
      click_button "Sign In"

      expect(page).to have_content("Parties You're In")
      expect(page).to have_content("Cruella")
      expect(page).to have_content(party.date.strftime("%B %d, %Y"))
      expect(page).to have_content(party.start_time.strftime("%l:%M %p"))
      expect(page).to have_content(user.email)
    end
=======
RSpec.describe 'user dashboard page' do
  before(:each) do
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
      it 'has form to add friend' do
        visit dashboard_path
        within('#friends') do
          expect(page).to have_field('friendship[friend_email]')
          expect(page).to have_button('Add Friend')
        end
      end
      it 'adds friends by email' do
        visit dashboard_path
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
        visit dashboard_path
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
        visit dashboard_path
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
    end
  end
>>>>>>> a9acbdac0b5e08f4c41d86f5b4d336bf7e20b536
end
