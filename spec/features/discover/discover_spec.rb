require 'rails_helper'

describe 'As a user' do
  before :each do
    User.create(email: 'test@gmail.com', password: 'test', first_name: 'Alex', last_name: 'Rivero')

    visit  '/'
    fill_in :email,	with: "test@gmail.com"
    fill_in :password,	with: "test"
    click_button 'Sign In'
  end

  it 'when I visit /discover' do
    visit '/discover'
    user = User.last
    expect(page).to have_content("Welcome #{user.first_name} #{user.last_name}")

    expect(page).to have_button('Find Top Rated Movies')
    expect(page).to have_button('Find Movies')
  end
end
