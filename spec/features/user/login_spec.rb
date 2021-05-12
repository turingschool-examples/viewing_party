require 'rails_helper'

RSpec.describe 'User Can Log In' do
  it 'as a registered user, I can log in with correct credentials' do
    user = User.create(email: 'some@example.com', password: 'mystrongpassword')

    visit root_path

    click_link 'Log in'

    expect(current_path).to eq(login_path)

    fill_in :email, with: user.email
    fill_in :password, with: 'mystrongpassword'

    click_button 'Log in'

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Welcome #{user.email}!")
    expect(page).to_not have_link("Log in")
    expect(page).to_not have_link("Register As A User")
    expect(page).to have_link("Log Out")
  end

  scenario 'With invalid credentials' do
    user = User.create(email: 'some@example.com', password: 'mystrongpassword')

    visit root_path

    click_link 'Log in'

    expect(current_path).to eq(login_path)

    fill_in :email, with: user.email
    fill_in :password, with: 'mystrongpasswordissuperstrong'

    click_button 'Log in'

    expect(current_path).to eq(login_path)
    expect(page).to have_content("Your email or password are incorrect")
  end
end
