require 'rails_helper'

RSpec.describe 'movie discover page' do
  it 'as a user, after logging in and clicking on discover movies, I am redirected to a discover page' do
    @user = User.create!(username: "eDog", email: "elah@email.com", password: "password")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    visit '/dashboard'

    within "#discover-movies" do
      click_button 'Discover Movies'
    end

    expect(current_path).to eq('/discover')
  end
end
