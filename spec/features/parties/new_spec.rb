require 'rails_helper'

RSpec.describe 'New viewing party page', type: :feature do
  before :each do
    @host = create(:user, password: 'password')
    @friend_1 = create(:user, password: 'password')
    @friend_2 = create(:user, password: 'password')
    @friend_3 = create(:user, password: 'password')

    @follow_1 = create(:follow, followee: @host, follower: @friend_1)
    @follow_2 = create(:follow, followee: @host, follower: @friend_2)
    @follow_3 = create(:follow, followee: @host, follower: @friend_3)

    @movie = create(:movie)
    
    visit registration_confirmation_user_url(@host)
    login(@host)
  end

  it 'has a form that when filled in with correct information creates a viewing party', :vcr do
    visit movie_path(155)
    click_on 'Create Viewing Party'

    expect(page).to have_field(:duration)
    fill_in :duration, with: 180

    expect(page).to have_field(:date)
    fill_in :date, with: '2021/04/01'

    expect(page).to have_field(:time)
    fill_in :time, with: '09:40:00'

    find(:css, "#friends_#{@friend_1.id}").set(true)
    find(:css, "#friends_#{@friend_2.id}").set(true)

    click_on "Create Event"

    expect(current_path).to eq(user_dashboard_index_path(@host))

    within ".hosted-parties" do
      expect(page).to have_content('The Dark Knight')
      expect(page).to have_content('09:40 AM')
      expect(page).to have_content('Thursday April 1st, 2021')
      expect(page).to have_content(@host.full_name)
      within ".invitees" do
        expect(page).to have_content(@friend_1.full_name)
        expect(page).to have_content(@friend_2.full_name)
      end
    end
  end

  it 'can not create a viewing party without a date', :vcr do
    visit movie_path(155)
    click_on 'Create Viewing Party'

    click_on 'Create Event'

    expect(page).to have_content("Time can't be blank and Date can't be blank")
  end
end
