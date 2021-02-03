require 'rails_helper'

RSpec.describe 'user can discover movies', type: :feature do
  describe 'as a user' do
    it 'i see 40 movies on the discover page' do
      visit discover_path

      expect(page).to have_content("20 Movies")
    end
  end
end
