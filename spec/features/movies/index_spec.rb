require 'rails_helper'

RSpec.describe 'movies index', type: :feature do
  describe 'as a user' do
    it 'i see 40 movies' do
      visit movies_path

      expect(page).to have_content("20 Movies")
    end
  end
end