require 'rails_helper'

describe "As a visitor" do
  describe "When I visit the root welcome page" do
    it "I see a message welcoming me to the site" do
      visit root_path

      expect(page).to have_content('Welcome to Viewing Party!')

      within '#description' do
        expect(page).to have_content('')
      end
    end
    
  end
end
