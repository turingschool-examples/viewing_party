require "rails_helper"

RSpec.describe 'As a user visiting the dashboard' do
  before :each do
    OmniAuth.config.test_mode = true

    OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new({
    :provider => 'google',
    :uid => "#{ENV['GOOGLE_CLIENT_ID']}"
    })

    visit '/'
    click_on "Login with Google"
  end

  it "has a main screen and links" do
    expect(current_path).to eq("/dashboard")
    expect(page).to have_content("Welcome #{@user}")
    expect(page).to have_link("Discover Movies")
    within "#friends" do
      expect(page).to have_content("Yo Friends")
    end
    within "#viewing-parties" do
      expect(page).to have_content("Yo Partays")
    end
  end
end
