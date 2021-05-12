# As an authenticated user,
# When I visit '/dashboard'
# I should see:
#
#  'Welcome <username>!' at the top of page
 #9 A button to Discover Movies
 #11 A viewing parties section
 #10 A friends section
require 'rails_helper'

RSpec.describe 'Dashboard', type: :feature do
  describe 'Dashboard Page' do
    before(:each) do
      @new_user = User.last
    end

    it "I can see and click a button to discover movies" do
      visit dashboard_path

      expect(page).to have_button("Discover Movies")

      click_button "Discover Movies"

      expect(current_path).to eq(discover_path)
    end

    it 'I can see a friends section' do
      visit dashboard_path

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Friends")
    end

    it 'I can see a viewing parties section' do
      visit dashboard_path

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Viewing Parties")
    end
  end
end
