require 'rails_helper'

describe 'As a user' do
  before :each do
    User.create(email: 'test@gmail.com', password: 'test', first_name: 'Alex', last_name: 'Rivero')

    visit  '/'
    fill_in :email,	with: "test@gmail.com"
    fill_in :password,	with: "test"
    click_button 'Sign In'
  end

  it "I am in the dashboard link" do
    expect(current_path).to eq('/dashboard')
  end

  it "Has clickable button to Discover movies" do
    expect(page).to have_button('Discover Movies')

    click_button 'Discover Movies'

    expect(current_path).to eq('/discover')
  end
end
