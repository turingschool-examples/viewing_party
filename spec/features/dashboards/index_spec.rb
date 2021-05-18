require 'rails_helper'

RSpec.describe 'discover page' do
  before :each do
    visit dashboards_path
  end

  context 'you visit your dashboard ' do
    it 'there is a button to search movies', :vcr do

      expect(page).to have_button('Discover Movies')

      click_on 'Discover Movies'

      expect(current_path).to eq(movies_path)

    end
  end
end
