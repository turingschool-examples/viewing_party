require 'rails_helper'

RSpec.describe 'discover page' do
  before :each do
    visit discover_path
  end

  context 'you want to discover movies' do
    it 'there is a button to discover top movies' do
      expect(page).to have_button('Find Top Rated Movies')
    end

    it 'there is a form to search for movies by name' do
      expect(page).to have_button('Find Movies')
    end
  end
end