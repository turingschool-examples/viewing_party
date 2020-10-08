require 'rails_helper'

RSpec.describe 'movie discover page' do
  before(:each) do
    @user = User.create!(username: "eDog", email: "elah@email.com", password: "password")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  it 'as a user, after logging in and clicking on discover movies, I am redirected to a discover page' do

    visit '/dashboard'

    within "#discover-movies" do
      click_button 'Discover Movies'
    end

    expect(current_path).to eq('/discover')
  end

  it 'When the user clicks on the top 40 button they should be taken to the movies page' do
    visit '/discover'

    expect(page).to have_button("Discover Top 40 Movies")
    click_button 'Discover Top 40 Movies'
    expect(current_path). to eq('/movies')
  end

  it 'displays search bar for movies' do
    visit '/discover'

    expect(page).to have_button('Search By Movie')
    expect(page).to have_field('Search')
  end
end
