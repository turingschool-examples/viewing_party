require 'rails_helper'

RSpec.describe "discover movies", :vcr do
  describe 'search functionality' do
    it 'displays search bar' do
      visit discover_index_path

      expect(page).to have_content('Find movies')
    end
  end
end
