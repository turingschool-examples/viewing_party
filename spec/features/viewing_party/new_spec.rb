require 'rails_helper'

RSpec.describe 'viewing party' do
    before :each do
      @user = User.create(name: "Bob", email: "joe@gmail.com", password: 'password1')
      @friend1 = User.create(name: "Berry", email: "berry@gmail.com", password: 'password1')
      @friend2 = User.create(name: "John", email: "john@gmail.com", password: 'password1')
      @friendship = Friend.create(user_id: @user.id, friend_id: @friend1.id)
      @friendship2 = Friend.create(user_id: @user.id, friend_id: @friend2.id)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    end
    it 'show page button brings us to new viewing party' do
    VCR.use_cassette('all_movie_info') do
      visit '/movies/550'
        click_button "Create Viewing Party for Movie"
        expect(current_path).to eq(new_party_path)
        expect(page).to have_content("Fight Club")
        expect(page).to have_content("Date of Party")
        expect(page).to have_content("Start of Party")
    end
  end

  it "shows checkboxes for each friend a user has " do
    VCR.use_cassette('all_movie_info') do
      visit '/movies/550'
      click_button "Create Viewing Party for Movie"
      expect(page).to have_content(@friend1.name)
      expect(page).to have_content(@friend2.name)
    end
  end

  it "does not error out if user has not friends" do
      VCR.use_cassette('all_movie_info') do
        Friend.destroy_all
        visit '/movies/550'
        click_button "Create Viewing Party for Movie"
        expect(page).to_not have_content(@friend1.name)
        expect(page).to_not have_content(@friend2.name)
    end
  end

  it "adds a viewing party when checkboxes are filled and button is submitted" do
    VCR.use_cassette('all_movie_info') do
      visit '/movies/550'
      click_button "Create Viewing Party for Movie"
      fill_in "party[duration]", with: 140
      fill_in "party[date]" , with: Time.new(2021, 10, 15)
      fill_in "party[start_time]", with: Time.now
      within("#friend-#{@friend1.id}") do
        check 'party[friend_check][]'
      end
      within("#friend-#{@friend2.id}") do
        check 'party[friend_check][]'
      end
      click_button "Start Viewing Party"
       expect(current_path).to eq(dashboard_path)
    end
  end
  it "sad path for missing data" do
  VCR.use_cassette('all_movie_info') do
    visit '/movies/550'
    click_button "Create Viewing Party for Movie"
    fill_in "party[duration]", with: 140
    within("#friend-#{@friend1.id}") do
      check 'party[friend_check][]'
    end
    within("#friend-#{@friend2.id}") do
      check 'party[friend_check][]'
    end
    click_button "Start Viewing Party"
    expect(current_path).to eq("/parties")
    expect(page).to have_content("Invites not sent, missing fields")
    end
  end
end
