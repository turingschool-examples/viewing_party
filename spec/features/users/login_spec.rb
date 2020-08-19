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

    expect(user.uid).to eq('112437885006810024511')
    expect(user.name).to eq('Michael Evans')
    expect(user.email).to eq('michaeljevans113@gmail.com')
    expect(user.access_token).to eq('ya29.a0AfH6SMDkPo8P3sHY1KO8OLQVGHwrQQm1aa31bBP5tTp0UlkUEeJmcESk7NGujZJLaoHBAyxEyMRNMyo73foVCrzYAn3NJNnrvuBO1agX_wZF9VsGEN8H_vZNJtbxX9m-8XtLU-sA35mOUEJA_hPxtTb_9iiNN-U6cIU')

    expect(current_path).to eq('/dashboard')
    expect(page).to have_content("Welcome, #{user.name}!")
  end
end
