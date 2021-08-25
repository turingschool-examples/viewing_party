require 'rails_helper'

RSpec.describe 'welcome page' do
  describe 'display' do
    it 'shows welcome message' do
      visit root_path
      expect(page).to have_content("welcome")
    end
  end
end