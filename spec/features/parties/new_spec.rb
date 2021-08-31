require 'rails_helper'

RSpec.describe "new movie party" do
  describe 'form' do
    it 'displays form to create movie party when filled out' do
      visit new_party_path

      save_and_open_page

      within('#form') do
        expect(page).to have_content('Movie Title')
        expect(page).to have_content('Lord of the Rings')
      end
    end
  end
end
