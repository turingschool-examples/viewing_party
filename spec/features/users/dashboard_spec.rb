require 'rails_helper'

RSpec.describe "User Dashboard" do
  before(:each) do
    @host = create(:user)

    @friend_1 = create(:user)
    @friend_2 = create(:user)
    @friend_3 = create(:user)

    @follow_1 = create(:follow, followee: @host, follower: @friend_1)
    @follow_2 = create(:follow, followee: @host, follower: @friend_2)
    @follow_3 = create(:follow, followee: @host, follower: @friend_3)

    @movie = create(:movie)

    @party = create(:party, movie: @movie, host: @host)

    @invitee_1 = create(:invitee, party: @party, user: @friend_1)
    @invitee_3 = create(:invitee, party: @party, user: @friend_3)
  end
  describe "As an authenticated user" do
    it "Displays a greeting, 'Discover Movies' button, parties section, friends section" do
      visit user_dashboard_index_path(@host)

      within("#greeting") do
        expect(page).to have_content("Welcome #{@host.full_name}")
      end

      within(".movies") do
        expect(page).to have_button("Discover Movies")
      end

      within(".friends") do
        expect(page).to have_css("#friend-#{@friend_1.id}")
        expect(page).to have_css("#friend-#{@friend_2.id}")
        expect(page).to have_css("#friend-#{@friend_3.id}")
      end

      within("#friend-#{@friend_1.id}") do
        expect(page).to have_content(@friend_1.full_name)
      end

      within("#friend-#{@friend_2.id}") do
        expect(page).to have_content(@friend_2.full_name)
      end

      within("#friend-#{@friend_3.id}") do
        expect(page).to have_content(@friend_3.full_name)
      end

      within(".parties") do
        expect(page).to have_css("#party-#{@party.id}")
      end

      within("#party-#{@party.id}") do
        expect(page).to have_content(@party.movie.title)
        expect(page).to have_content(@party.time)
        expect(page).to have_content(@party.duration)
        expect(page).to have_content(@party.host.full_name)
      end
    end
  end
end

