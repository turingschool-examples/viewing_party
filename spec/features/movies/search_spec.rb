require 'rails_helper'

feature 'Searching by movie title' do
  scenario "User searches using keywords", :vcr do

    visit '/discover'
    fill_in 'Keywords', with: 'whatever'
    click_button('Search By Movie Title')

    expect(current_path).to eq('/movies')
    expect(page).to have_content("Whatever Works")
    expect(page).to have_content("Vote Average: 7.1")
    expect(page).to have_content("Whatever it Takes")
    expect(page).to have_content("Vote Average: 6.5")
    expect(page).to have_css('ul', :count => 40)
  end
end


feature 'Empty search results in top 40' do
  scenario "User searches with empty field", :vcr do
    visit '/discover'

    click_button('Search By Movie Title')
    expect(current_path).to eq('/movies')

    expect(current_path).to eq('/movies')
    expect(page).to have_content("The Green Mile")
    expect(page).to have_content("Vote Average: 8.5")
    expect(page).to have_content("Pulp Fiction")
    expect(page).to have_content("Vote Average: 8.5")
  end
end
