require 'rails_helper'

describe 'User log in' do
  it 'as a registered user, I can log in with an email and password. My password is stored with bcrypt' do
    user = User.create(user_name: 'joeyh@test.com', password: 'doyouwanttohearasong')
    visit root_path

    click_button 'Log in'

    expect(current_path).to eq(login_path)

    fill_in :user_name, with: 'joeyh@test.com'
    fill_in :password, with: 'doyouwanttohearasong'

    click_button 'Log in'

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content('Welcome joeyh@test.com!')
    expect(page).to_not have_link('I already have an account')
    expect(page).to_not have_link('Sign Up to Be a User')
  end

  it 'as a registered user, I cannot log in with incorrect credentials' do
    user = User.create(user_name: 'joeyh@test.com', password: 'doyouwanttohearasong')

    visit root_path

    click_button 'Log in'

    expect(current_path).to eq(login_path)

    fill_in :user_name, with: 'joeyh@test.com'
    fill_in :password, with: 'beetlejuice'

    click_button 'Log in'

    expect(current_path).to eq(login_path)
    expect(page).to have_content('Your email or password are incorrect')
  end
  it 'as a registered user, I can use navbar' do
    user = User.create(user_name: 'joeyh@test.com', password: 'doyouwanttohearasong')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit dashboard_path
    expect(page).to have_link('Discover Movies')
    click_link('Discover Movies')
    expect(current_path).to eq(discover_path)
    expect(page).to have_link('Dashboard')
    click_link('Dashboard')
    expect(current_path).to eq(dashboard_path)
    expect(page).to have_link('Log Out')
    click_link('Log Out')
    expect(current_path).to eq(root_path)

    expect(page).to have_content('You have been logged out')
    # # expect(page).to_not have_link('Discover Movies')
    # # expect(page).to_not have_link('Dashboard')
    # # expect(page).to_not have_link('Log Out')
  end
  it 'cant see navbar without being logged in' do
    visit root_path
    expect(page).to_not have_link('Discover Movies')
    expect(page).to_not have_link('Dashboard')
    expect(page).to_not have_link('Log Out')
  end
end
