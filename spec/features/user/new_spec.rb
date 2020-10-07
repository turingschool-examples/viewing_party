# When a user visits the '/registration' path they should see a form to register.
# The form should include:
#
# Email
# Password
# Password Confirmation
# Register Button
# Once the user registers they should be logged in and redirected to the dashboard page

require 'rails_helper'

RSpec.describe 'User Registration' do
  it 'Registration link takes visitor to registration form' do
    user = User.create!(email: 'tony@stark.com', password: '1234')
    visit root_path

    click_link 'Register Here'

    expect(current_path).to eq(user_registration_path)
  end

  it 'Visitor completes registration form and registers as a user' do
    visit root_path

    click_link 'Register Here'

    expect(current_path).to eq(user_registration_path)

    fill_in :email, with: 'new_user@user.com'
    fill_in :password, with: '1234'
    fill_in :password_confirmation, with: '1234'

    click_button 'Register'

    user = User.all.last
    expect(current_path).to eq(user_dashboard_path(user.id))
  end

  it 'Visitor registration form email sad path' do
    visit root_path

    click_link 'Register Here'

    expect(current_path).to eq(user_registration_path)

    fill_in :email, with: ''
    fill_in :password, with: '1234'
    fill_in :password_confirmation, with: '1234'

    click_button 'Register'

    expect(current_path).to eq(user_registration_path)

    expect(page).to have_content("Email can't be blank")
  end

  it 'Visitor registration form password sad path' do
    visit root_path

    click_link 'Register Here'

    expect(current_path).to eq(user_registration_path)

    fill_in :email, with: 'user@user.com'
    fill_in :password, with: ''
    fill_in :password_confirmation, with: ''

    click_button 'Register'

    expect(current_path).to eq(user_registration_path)

    expect(page).to have_content("Password can't be blank")
  end

  it 'Visitor registration form password confirmation sad path' do
    visit root_path

    click_link 'Register Here'

    expect(current_path).to eq(user_registration_path)

    fill_in :email, with: 'user@user.com'
    fill_in :password, with: '1234'
    fill_in :password_confirmation, with: '5432'

    click_button 'Register'

    expect(current_path).to eq(user_registration_path)

    expect(page).to have_content("Passwords do not match")
  end
end
