require 'rails_helper'

RSpec.describe 'New viewing party page' do
  before :each do
    @user = User.create!(email: 'tony@stark.com', password: '1234')
    @friend1 = User.create!(email: 'elon@musk.com', password: '1234')
    @friend2 = User.create!(email: 'nikola@tesla.com', password: '1234')
    @friend3 = User.create!(email: 'thomas@edison.com', password: '1234')

    @party2 = Party.create!(title: "Rush Hour", duration: 220, date: '12/20/20', time: '4:00')

    UserParty.create!(party_id: @party2.id, attendee_id: @friend1.id, is_host: true)
    UserParty.create!(party_id: @party2.id, attendee_id: @friend2.id)
    UserParty.create!(party_id: @party2.id, attendee_id: @user.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  it "I can create a new viewing party", :vcr do
    Friendship.create_reciprocal_for_ids(@user.id, @friend1.id)
    Friendship.create_reciprocal_for_ids(@user.id, @friend2.id)
    Friendship.create_reciprocal_for_ids(@user.id, @friend3.id)


    visit top_movies_path

    click_link("The Shawshank Redemption")

    click_button "Create Viewing Party for Movie"
    movie_id = current_path.split('/')[2].to_i
    expect(current_path).to eq(movie_party_path(movie_id))

    fill_in :duration, with: 200
    fill_in :date, with: '2020/10/14'
    fill_in :time, with: '06:00 PM'
    within('.friends') do
      page.check(@friend1.email)
      page.check(@friend2.email)
    end
    click_button("Create Party")
    expect(current_path).to eq(user_dashboard_path)

    new_party = Party.all.last

    within "#party-#{new_party.id}" do
      expect(page).to have_content(new_party.title)
      expect(page).to have_content(new_party.date)
      expect(page).to have_content(new_party.time)
      expect(page).to have_content("Hosting")
    end

    within "#party-#{@party2.id}" do
      expect(page).to have_content(@party2.title)
      expect(page).to have_content(@party2.date)
      expect(page).to have_content(@party2.time)
      expect(page).to have_content("Invited")
    end
  end
end
