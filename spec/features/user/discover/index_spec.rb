require "rails_helper"

RSpec.describe 'As an authenticated user' do
  before(:each) do
    stub_omniauth
    visit root_path
    expect(page).to have_link("Sign in with Google")
    click_link "Sign in with Google"
  end

  describe "On my dashboard" do
    it "when I click the 'Discover Movies' button I am taken to a discover page" do

      expect(current_path).to eq("/dashboard")

      click_button("Discover Movies")

      expect(current_path).to eq("/discover")
    end
  end
end
