require 'rails_helper'

RSpec.describe 'User Login' do
  it 'should allow a user with a valid email and password to login' do
    user = User.create!(email: 'tony@stark.com', password: '1234')
    visit root_path

    fill_in :email, with: user.email

    fill_in :password, with: user.password

    click_button('Sign In')

    expect(current_path).to eq(user_dashboard_path(user.id))
  end

  it "should not login with bad email" do
    user = User.create!(email: 'tony@stark.com', password: '1234')
    visit root_path

    fill_in :email, with: 'capt@america.com'

    fill_in :password, with: user.password

    click_button('Sign In')

    expect(current_path).to eq(root_path)
    expect(page).to have_content('email or password is incorrect')
  end

  it "should not login with bad password" do
    user = User.create!(email: 'tony@stark.com', password: '1234')
    visit root_path

    fill_in :email, with: user.email

    fill_in :password, with: '4321'

    click_button('Sign In')

    expect(current_path).to eq(root_path)
    expect(page).to have_content('email or password is incorrect')
  end
end
