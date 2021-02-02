require 'rails_helper'

RSpec.describe('Welcome Page') do
  describe 'happy path' do
    it 'should display the welcome page with message and description' do
      visit root_path

      expect(page).to have_content('Welcome to Viewing Party')
      expect(page).to have_content('Doggo ipsum pupperino heck shoober such treat smol borking doggo with a long snoot for pats,')
    end
  end
end
