require 'rails_helper'

RSpec.describe 'As a visitor, when I visit the welcome page' do
  it 'I can log in using my Google account information' do
    OmniAuth.config.test_mode = true

    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
      :provider     => 'google_oauth2',
      :uid => ENV['GOOGLE_UID'],
      :info => {:name => 'Michael Evans', :email => 'michaeljevans113@gmail.com'},
      :credentials => {:token => ENV['GOOGLE_TOKEN']}
      })

    visit '/'

    click_button 'Log In with Google'

    user = User.last

    expect(user.uid).to eq(ENV['GOOGLE_UID'])
    expect(user.name).to eq('Michael Evans')
    expect(user.email).to eq('michaeljevans113@gmail.com')
    expect(user.access_token).to eq(ENV['GOOGLE_TOKEN'])

    expect(current_path).to eq('/dashboard')
    expect(page).to have_content("Welcome, #{user.name}!")
  end
end
