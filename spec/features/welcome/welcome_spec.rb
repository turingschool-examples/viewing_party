require 'rails_helper'

RSpec.describe 'As any user' do
  describe 'When I visit the landing page' do
    it 'Shows me a welcome page' do

      visit "/"

      expect(page).to have_content("Welcome to Viewing Party!")
      expect(page).to have_content("Watch movies with your friends.")
    end
  end 
end
