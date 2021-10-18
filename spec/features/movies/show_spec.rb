require 'rails_helper'

RSpec.describe 'Movies Show Page' do
  before :each do
    @user = create(:mock_user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    stub_movie_info_by_id

    visit movie_path(337404)
  end

  describe 'create viewing party button' do
    it 'displays create viewing party button' do

      expect(page).to have_button('Create Viewing Party')

      click_on 'Create Viewing Party'

      expect(current_path).to eq(new_party_path)
    end
  end

  describe "movies attributes" do
    it "displays that movie's attributes" do
      expect(page).to have_content('Title')
      expect(page).to have_content('Runtime')
      expect(page).to have_content('Cast')
      expect(page).to have_content('Summary')
      expect(page).to have_content('Review(s)')
      expect(page).to have_content('Author')
    end

    it "displays that movie's attributes" do
      expect(page).to have_content('Cruella')
      expect(page).to have_content(134)
      expect(page).to have_content('Emma Stone as Estella')
    end
  end
end
