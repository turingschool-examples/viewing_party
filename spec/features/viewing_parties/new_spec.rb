require 'rails_helper'

RSpec.describe 'New viewing party page' do
  before :each do
    @user = User.create!(email: 'tony@stark.com', password: '1234')
    @friend1 = User.create!(email: 'elon@musk.com', password: '1234')
    @friend2 = User.create!(email: 'nikola@tesla.com', password: '1234')

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  it "Should have a form to create a new viewing party", :vcr do
    Friendship.create_reciprocal_for_ids(@user.id, @friend1.id)
    Friendship.create_reciprocal_for_ids(@user.id, @friend2.id)

    visit top_movies_path

    click_link("The Shawshank Redemption")

    click_button "Create Viewing Party for Movie"
    movie_id = current_path.split('/')[2].to_i
    expect(current_path).to eq(movie_party_path(movie_id))

    expect(page).to have_content("Movie: The Shawshank Redemption")
    expect(find_field("Party duration (in minutes):").value).to eq('142')
    expect(page).to have_field(:date)
    expect(page).to have_field(:time)
    within '.friends' do
      @user.friends.each do |friend|
        expect(page).to have_unchecked_field(friend.email)
      end
    end
    expect(page).to have_button('Create Party')
  end

  it "Cannot create a new viewing party with no friends", :vcr do

    visit top_movies_path

    click_link("The Shawshank Redemption")

    click_button "Create Viewing Party for Movie"
    movie_id = current_path.split('/')[2].to_i
    expect(current_path).to eq(movie_party_path(movie_id))

    expect(page).to have_content("Movie: The Shawshank Redemption")
    expect(find_field("Party duration (in minutes):").value).to eq('142')
    expect(page).to have_field(:date)
    expect(page).to have_field(:time)
    within '.friends' do
      expect(page).to have_content('No friends to invite to your viewing party.')
    end
    expect(page).to_not have_button('Create Party')
  end

  it "I can create a new viewing party with invited friends", :vcr do
    Friendship.create_reciprocal_for_ids(@user.id, @friend1.id)
    Friendship.create_reciprocal_for_ids(@user.id, @friend2.id)

    visit top_movies_path

    click_link("The Shawshank Redemption")

    click_button "Create Viewing Party for Movie"
    movie_id = current_path.split('/')[2].to_i
    expect(current_path).to eq(movie_party_path(movie_id))

    expect(page).to have_content("Movie: The Shawshank Redemption")
    expect(find_field("Party duration (in minutes):").value).to eq('142')
    fill_in :duration, with: 200
    fill_in :date, with: '2020/10/14'
    fill_in :time, with: '06:00 PM'
    within('.friends') do
      page.check(@friend1.email)
    end
    click_button("Create Party")
    new_party = Party.all.last
    expect(new_party.title).to eq("The Shawshank Redemption")
    expect(current_path).to eq(user_dashboard_path)
  end

  it "I cannot create a new viewing party without inviting friends", :vcr do
    Friendship.create_reciprocal_for_ids(@user.id, @friend1.id)
    Friendship.create_reciprocal_for_ids(@user.id, @friend2.id)

    visit top_movies_path

    click_link("The Shawshank Redemption")

    click_button "Create Viewing Party for Movie"
    movie_id = current_path.split('/')[2].to_i
    expect(current_path).to eq(movie_party_path(movie_id))

    expect(page).to have_content("Movie: The Shawshank Redemption")
    expect(find_field("Party duration (in minutes):").value).to eq('142')
    fill_in :duration, with: 200
    fill_in :date, with: '2020/10/14'
    fill_in :time, with: '06:00 PM'
    click_button('Create Party')
    expect(page).to have_content("Friends must be selected to start a party")
    expect(current_path).to eq(movie_party_path(movie_id))
  end
end
