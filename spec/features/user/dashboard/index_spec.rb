require 'rails_helper'

RSpec.describe 'As a verified user' do
  before(:each) do
    stub_omniauth
    visit root_path
    expect(page).to have_link("Sign in with Google")
    click_link "Sign in with Google"
  end

  describe 'When I log in' do
    it 'see\s a dashboard that welcomes me' do

      expect(current_path).to eq("/dashboard")
      expect(page).to have_content("Welcome Tony Stark!")
      expect(page).to have_css ".friends"
      expect(page).to have_button("Discover Movies")
      expect(page).to have_css(".viewing_parties")
    end
  end
end
