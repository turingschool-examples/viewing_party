require 'rails_helper'

RSpec.describe 'Party New Page' do
  before :each do
    @user = create(:mock_user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    visit movie_path(337404)
  end

  describe 'party details' do
    it 'displays all of the party detail fields' do
      click_on 'Create Viewing Party'

      expect(current_path).to eq(new_party_path)

      expect(page).to have_content('Viewing Party Details for')
      expect(page).to have_field(:duration)
      expect(page).to have_field(:time)
      expect(page).to have_field(:date)
      expect(page).to have_button('Create Party')
    end

    xit 'displays details of that movie' do
      visit '/parties/new?movie_id=337404'

      fill_in :duration, with: 200
      fill_in :date, with: '10/20/2021'
      fill_in :time, with: '05:00 PM'

      friend = create(:mock_user)
      @user.friends << friend

      click_on 'Create Party'

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content('Party has been created successfully. Have fun!')
    end

    it "can't create a party with empty fields" do
      visit '/parties/new?movie_id=337404'

      fill_in 'duration', with: 190
      click_on "Create Party"

      expect(page).to have_content('Please make sure all fields are valid')
      expect(current_path).to eq(new_party_path)
    end

    it "can't create a party with less duration time than the movie" do
      visit '/parties/new?movie_id=337404'

      fill_in 'duration', with: 100
      fill_in :date, with: '10/20/2021'
      fill_in :time, with: '05:00 PM'

      click_on "Create Party"

      expect(page).to have_content('Party duration cannot be less than movie runtime.')
      expect(current_path).to eq(new_party_path)
    end
  end
end
