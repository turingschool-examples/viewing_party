require 'rails_helper'

RSpec.describe 'The User dashboard' do
  before :each do
    @user = User.create!(email: 'test@test.com', password: 'password123', password_confirmation: 'password123')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit dashboard_path
  end

  it 'has a welcome message' do
    expect(page).to have_content("Welcome, #{@user.email}!")
  end

  it 'has a button to discover movies' do
    expect(page).to have_button('Discover Movies')
    click_button 'Discover Movies'
    expect(current_path).to eq(movies_path)
  end
end
