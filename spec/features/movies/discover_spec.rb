require 'rails_helper'

RSpec.describe 'Movies Discover Page' do
  describe 'Discover Page' do
    it 'displays all search features, go back to dashboard and logout' do
      visit discover_path

      expect(page).to have_button('Find Top Rated Movies')
      expect(page).to have_content('OR')
      expect(page).to have_field('Search by movie title')
      expect(page).to have_button('Find Movies')

      expect(page).to have_link('Back to Dashboard')
      expect(page).to have_link('Log Out')
    end
  end
end
