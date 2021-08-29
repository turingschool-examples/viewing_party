require 'rails_helper'

RSpec.describe "discover movies", :vcr do
  before(:each) do
    @user = User.create!(email: 'test@test.com', password: 'pswd')
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
    end

    it 'displays first 40 keywords search results' do
      input = 'The'

      visit discover_index_path

      within('#search_for_movies') do
        fill_in 'keywords', with: input
        click_button 'Find Movies'
      end

      expect(page).to have_content('The Suicide Squad, Vote Average: 8')
      expect(page).to have_content('The Forever Purge, Vote Average: 7.5')
      expect(page).to have_content('The Unholy, Vote Average: 6.9')
      expect(page).to have_content('The Meg, Vote Average: 6.2')
      expect(page).to have_content('The Seventh Day, Vote Average: 5.6')
    end
  end
end
