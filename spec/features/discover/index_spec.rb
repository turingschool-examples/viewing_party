require 'rails_helper'

RSpec.describe "discover movies", :vcr do
  before(:each) do
    @user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  describe 'display' do
    it 'displays welcome message to user' do
      visit discover_index_path

      expect(page).to have_content("Welcome #{@user.email}!")
    end
  end

  describe 'search functionality' do
    it 'input search keywords leads to movies page' do
      input = 'The'

      visit discover_index_path

      within('#search_for_movies') do
        fill_in 'keywords', with: input
        click_button 'Find Movies'
      end

      expect(current_path).to eq(movies_path)
      expect(page).to have_content("Welcome #{@user.email}!")
    end

    it 'displays first 40 keywords search results' do
      input = 'The'

      visit discover_index_path

      within('#search_for_movies') do
        fill_in 'keywords', with: input
        click_button 'Find Movies'
      end

      expect(page).to have_selector('.card', count: 40)
    end
  end

  describe 'top forty button' do
    it 'returns the top 40 rated movies' do
      # Capybara.default_driver = :selenium_chrome_headless
      visit discover_index_path
      click_on("Top Rate Movies")
      #movies index generates 40 movie cards
      expect(page).to have_selector('.card', count: 40)

      # Capybara.run_server = false
    end
  end
end
