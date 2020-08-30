require 'rails_helper'

RSpec.describe "As a logged in user" do
  describe  "Viewing parties new page" do
    before(:each) do

      @info = {
        id: 393,
        title: "Kill Bill: Vol. 2",
        overview: "One of the best Tarantino films ever!",
        vote_average: 10,
        runtime: 136,
        genres: [{name: "Action"}, {name: "Suspense"}, {name: "Revenge"}]
      }

      @reviews = [{author: "Josh T", content: "This is a super fun film!"}, {author: "Phillip S", content: "Fun for the whole family!"}]

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
      @user = User.create!(username: "Quentin", email: "tarantino@gmail.com")
      @user2 = User.create!(username: "Francis", email: "coppola@wine.com")
      @user3 = User.create!(username: "Martin", email: "scorsese@hotmail.com")
      Friendship.create!(user: @user, friend: @user2)
      Friendship.create!(user: @user, friend: @user3)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      allow_any_instance_of(MoviesService).to receive(:film_info).and_return(@info)
      allow_any_instance_of(MoviesService).to receive(:cast).and_return(@cast)
      allow_any_instance_of(MoviesService).to receive(:movie_reviews).and_return(@reviews)
    end
    it "has a form to create a new viewing party" do
      visit "/movies/#{@movie.id}"

      click_on "Create Viewing Party for #{@movie.title}"

      expect(current_path).to eq('/dashboard/viewing_parties/new')
      expect(page).to have_content("Movie Title: #{@movie.title}")
      expect(page).to have_content("Duration of party:")
      expect(page).to have_content("Date")
      expect(page).to have_content("Start time")
      expect(page).to have_button("Create Party!")
    end
    it "can create a party" do
      json_response = File.read('spec/fixtures/calendar_event_success.json')
      allow_any_instance_of(Google::Apis::CalendarV3::CalendarService).to receive(:insert_event).and_return(json_response)

      visit "/movies/#{@movie.id}"
      click_on "Create Viewing Party for #{@movie.title}"
      fill_in "date", with: "2020-08-28"
      fill_in "start_time", with: "07:00"
      check @user2.username
      click_on "Create Party!"

      expect(current_path).to eq("/dashboard")

      within ".viewing-parties-list" do
        expect(page).to have_content(@movie.title)
        expect(page).to_not have_button("Add to Google Calendar")
      end
      expect(page).to have_content("Party Host: #{@user.username}")

      expect(@user.view_parties.length).to eq(1)
      expect(@user2.view_parties.length).to eq(1)
      expect(@user3.view_parties.length).to eq(0)
    end
    it "toggles add to calendar button" do
      json_response = File.read('spec/fixtures/calendar_event_success.json')
      allow_any_instance_of(Google::Apis::CalendarV3::CalendarService).to receive(:insert_event).and_return(json_response)

      @party = @user2.view_parties.create!(date: "2020-08-28", time: "07:00", movie_title: @movie.title, runtime: @movie.runtime)
      @party.users << @user

      visit '/dashboard'

      within ".viewing-parties-list" do
        expect(page).to have_content(@movie.title)
        expect(page).to have_button("Add to Google Calendar")
      end

      click_on "Add to Google Calendar"

      expect(current_path).to eq("/dashboard")

      within ".viewing-parties-list" do
        expect(page).to have_content(@movie.title)
        expect(page).to_not have_button("Add to Google Calendar")
      end
    end
  end

end
