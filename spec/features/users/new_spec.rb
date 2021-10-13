require 'rails_helper'

RSpec.describe 'user registration form' do
  it 'creates a new user' do
    visit root_path

    click_on 'New to Viewing Party? Register here'

    expect(current_path).to eq(new_user_path)

    first_name = 'Molly'
    last_name = 'Dolly'
    email = 'niftykitty@gmail.com'
    password = 'test'

    fill_in 'user[first_name]', with: first_name
    fill_in 'user[last_name]', with: last_name
    fill_in 'user[email]', with: email
    fill_in 'user[password]', with: password
    fill_in 'user[password_confirmation]', with: password

    click_on "Register User"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content('Welcome Molly Dolly!')
  end

  it 'will not create user without matching confirmation' do
    visit new_user_path

    first_name = 'Molly'
    last_name = 'Dolly'
    email = 'niftykitty@gmail.com'
    password = 'test'
    incorrect = 'bummer'

    fill_in 'user[first_name]', with: first_name
    fill_in 'user[last_name]', with: last_name
    fill_in 'user[email]', with: email
    fill_in 'user[password]', with: password
    fill_in 'user[password_confirmation]', with: incorrect

    click_on "Register User"

    expect(current_path).to eq(new_user_path)
    expect(page).to have_content('Account not created:')
  end

  it 'will not create user without all attributes' do
    visit new_user_path

    first_name = 'Molly'
    last_name = 'Dolly'
    email = 'niftykitty@gmail.com'
    password = 'test'
    incorrect = 'bummer'

    fill_in 'user[first_name]', with: first_name
    fill_in 'user[last_name]', with: last_name
    fill_in 'user[password]', with: password
    fill_in 'user[password_confirmation]', with: password

    click_on "Register User"

    expect(current_path).to eq(new_user_path)
    expect(page).to have_content('Account not created:')

    fill_in 'user[email]', with: email
    fill_in 'user[password]', with: password
    fill_in 'user[password_confirmation]', with: password

    click_on "Register User"

    expect(current_path).to eq(new_user_path)
    expect(page).to have_content('Account not created:')
  end

  it 'has link for existing users' do
    visit new_user_path

    expect(page).to have_link('Already Registered? Log in Here')
    click_on 'Already Registered? Log in Here'

    expect(current_path).to eq(root_path)
  end
end
