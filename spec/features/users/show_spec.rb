require 'rails_helper'

RSpec.describe 'User Dashboard Page' do
  before :each do
    visit dashboard_path
  end

  describe 'User dashboard has viewing parties' do
    it 'shows viewing parties that user is hosting' do

      click_on "Log Out"
      save_and_open_page

      User.destroy_all
      movie = VCR.use_cassette("movie_info_by_id") do
        MovieFacade.movie_info_by_id(337404)
      end

      user = create(:mock_user, password: 'hello')
      friend = create(:mock_user)
      user.friends << friend

      party = create(:mock_party, host_id: user.id, movie_id: movie.id, title: movie.title)
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
end
