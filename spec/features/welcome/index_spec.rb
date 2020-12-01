require 'rails_helper'

RSpec.describe "as a user" do
  describe "when I visit '/'" do 
    it 'I see a welcome message' do
      visit '/'

      expect(page).to have_content("Welcome to Viewing Party")
      expect(page).to have_content("Description")
    end
  end
end
