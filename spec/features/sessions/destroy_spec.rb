require 'rails_helper'

RSpec.describe 'Logout function', type: :feature do
  before :each do
    @user = User.create!(full_name: 'Andrew J', email: 'example@email.com', password: 'password')
    visit registration_confirmation_user_url(@user)
    login(@user)
  end

  it 'ends the users session when they logout' do
    expect(page).to have_button("Logout")
    click_on "Logout"

    expect(current_path).to eq(root_path)
    expect(page).to have_button('Login')

    visit user_dashboard_index_path(@user)
    expect(current_path).to eq(login_path)
    expect(page).to have_content("You must be logged in to perform that action")
  end
end
