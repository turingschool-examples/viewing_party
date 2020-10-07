require 'rails_helper'

RSpec.describe 'user dashboard' do
  it 'as a user, after logging in, I see a welcome message with my username, along with a discover movies section, a friends section, and a viewing parties section' do
    visit '/'
    @user = User.create!(username: "eDog", email: "elah@email.com", password: "password")
    click_button("Login")

    expect(current_path).to eq("/login")

    fill_in :email, with: @user.email
    fill_in :password, with: @user.password

    click_button("Login")

    expect(current_path).to eq("/dashboard")

    expect(page).to have_content("Welcome #{@user.username}")
    expect(page).to have_button('Discover Movies')
    expect(page).to have_content('Check Out Yo Friends')
    expect(page).to have_content('Check Out Yo Viewing Parties')
  end
end
