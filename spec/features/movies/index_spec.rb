require 'rails_helper'

feature 'as a user' do
  given!(:user) {@user = create(:user)}
  describe 'when I visit the discover page' do
    it 'I can search for movies' do
      page.set_rack_session(user_id: @user.id)

      visit discover_index_path
      expect(page).to have_field(:query)
      expect(page).to have_button('Search')

      fill_in :query, with: 'batman'
      click_button 'Search'

      expect(current_path).to eq(movies_path)
      expect(page).to have_css('.movie', count: 40)

      within(first('.movie')) do
        expect(page).to have_css('.title')
        expect(page).to have_css('.rating')
        expect(page).to have_link('Batman: Death in the Family')
        expect(page).to have_content('7.3')
        title = find('.title').text
        rating = find('.rating').text
        expect(title).to_not be_empty
        expect(rating).to_not be_empty
      end

      within(:xpath, '(//li[@class="movie"])[last()]') do
        expect(page).to have_css('.title')
        expect(page).to have_css('.rating')
        expect(page).to have_link('Batman Unlimited: Mechs vs. Mutants')
        expect(page).to have_content('6.1')
        title = find('.title').text
        rating = find('.rating').text
        expect(title).to_not be_empty
        expect(rating).to_not be_empty
      end

      save_and_open_page
    end
  end
end
