require 'rails_helper'

RSpec.describe "Movies Show Page" do
  before :each do
    @user = User.create(password: "hello", email: "sample@email.com")
    visit root_path
    click_on "Log In!"
    expect(current_path).to eq(login_path)
    fill_in :email, with: @user.email
    fill_in :password, with: @user.password
    click_on "Log In"
    # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end
  describe "When I visit the movie's detail page as a logged in user" do
    it "displays the logged in user email" do
      VCR.use_cassette('movie_show_page_display_fight_club_10') do
        visit movie_path(424)
        save_and_open_page
        within "#userInfo" do
          expect(page).to have_content("Welcome #{@user.email}!")
        end
      end
    end
    it "has button to make a new viewing party" do
      VCR.use_cassette('movie_show_page_display_fight_club_20') do
        visit movie_path(424)
      end
      VCR.use_cassette('movie_show_page_new_party') do
        within "#newParty" do
          expect(page).to have_button("Create Viewing Party for Movie")
          click_button("Create Viewing Party for Movie")
          expect(current_path).to eq(new_party_path)
        end
      end
    end
    it "displays similar movies" do
      VCR.use_cassette('movie_show_page_display_fight_club_30') do
        visit movie_path(424)
      end
      VCR.use_cassette('similar_to_fight_club') do
        within "#similarMovies" do
          expect("The Pianist").to appear_before("Fury")
        end
      end
    end
  end
end
