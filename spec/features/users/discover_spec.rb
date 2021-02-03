require 'rails_helper'

RSpec.describe 'user can discover movies', type: :feature do
  describe 'as a user' do
    it 'i see a button to discover top 40 movies and it takes me to movies index' do
      visit discover_path

      expect(page).to have_button("Discover Top 40 Movies")
      
      click_button "Discover Top 40 Movies"

      expect(current_path).to eq(movies_path)
    end
  end
end
