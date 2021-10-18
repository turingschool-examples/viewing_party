require 'rails_helper'

RSpec.describe 'movie index page' do

  scenario 'user clicks on Discover Top 40 Movies ', :vcr do
    visit discover_path
    click_on 'Discover Top 40 Movies'
    expect(current_path).to eq(movies_path)
    expect(page).to have_content('Pulp Fiction')
  end

  scenario 'user searches by title of a movie', :vcr do
    visit discover_path
    fill_in :search, with: 'Pulp Fiction'
    click_on 'Search by Movie Title'
    expect(page).to have_content('Pulp Fiction')
  end
end
