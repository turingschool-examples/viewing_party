require 'rails_helper'

RSpec.describe "As a registered user" do
  describe "on dashboard show page" do
    before :each do
      @user = User.create!(username: "Quentin", email: "tarantino@gmail.com")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    end
    it "can access the discover page from the dashboard" do
      visit '/dashboard'

      expect(page).to have_link("Discover Movies!")

      click_on "Discover Movies!"

      expect(current_path).to eq('/dashboard/discover')
    end
  end
  describe "on dashboard show page", :vcr do
    before :each do
      @user = User.create!(username: "Quentin", email: "tarantino@gmail.com")
      @user2 = User.create!(username: "Francis", email: "coppola@wine.com")
      @user3 = User.create!(username: "Martin", email: "scorsese@hotmail.com")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      @info = {
        id: 393,
        title: "Kill Bill: Vol. 2",
        overview: "One of the best Tarantino films ever!",
        vote_average: 10,
        runtime: 136,
        genres: [{name: "Action"}, {name: "Suspense"}, {name: "Revenge"}]
      }

      @cast = [
        {
          name: "Uma Thurman",
          character: "Beatrix \'The Bride\' Kiddo"
        },
        {
          name: "Lucy Liu",
          character: "O-Ren Ishii"
        },
        {
          name: "David Carradine",
          character: "Bill"
        }
      ]

      @movie = Movie.new(@info, @cast)
      @party = @user.view_parties.create!(date: "2020-08-28", time: "07:00", movie_title: @movie.title, runtime: @movie.runtime, host: @user.username)
    end
    it "has a link to discover top movies" do
      visit '/dashboard/discover'

      expect(page).to have_button("Find Top Rated Movies")

      click_on "Find Top Rated Movies"

      expect(current_path).to eq('/movies')
    end
    it "has a friends section that is empty if no friendships" do
      visit dashboard_path

      expect(page).to have_content("Friends")
      expect(page).to have_content("You currently have no friends")
      expect(page).to have_button("Add Friend")
    end
    it "displays party attendees and rsvps for upcoming parties" do
      # json_response = File.read('spec/fixtures/calendar_event_success.json')
      # allow_any_instance_of(Google::Apis::CalendarV3::CalendarService).to receive(:insert_event).and_return(json_response)
      @party.users << @user2
      @party.users << @user3
      @user2.rsvp(@party)

      visit dashboard_path

      within ".view-party" do
        expect(page).to have_content("Party Host: #{@user.username}")
        expect(page).to have_content("1 Attending")
        expect(page).to have_content(@user2.username)
      end
    end
  end
end
