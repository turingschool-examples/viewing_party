require 'rails_helper'

describe 'user dashboard' do
  it 'shows all movies for a certain user' do
    visit dashboard_path
    expect(current_path).to eq('/login')
    expect(page).to have_content('You need to log in to view your dashboard buddy')

    user = User.create(id: 99, email: "rusty@dusty.com", password: "137952")

    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button 'Log In'

    expect(current_path).to eq(root_path)
    expect(page).not_to have_content('You need to log in to view your dashboard buddy')

    click_link 'Dashboard'
    expect(current_path).to eq(dashboard_path)
  end
end
