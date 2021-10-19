require 'rails_helper'

RSpec.describe 'Party New Page' do
  before :each do
    @user = create(:mock_user)
    @friend_1 = create(:mock_user)
    @friend_2 = create(:mock_user)
    @friend_3 = create(:mock_user)
    @friend_4 = create(:mock_user)
    @user.friends << @friend_1
    @user.friends << @friend_2
    @user.friends << @friend_3

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    visit movie_path(337404)
  end

  describe 'party details' do
    it 'displays all of the party detail fields', :vcr do
      movie = MovieFacade.movie_info_by_id(337404)
      click_on 'Create Viewing Party'

      expect(current_path).to eq(new_party_path)

      expect(page).to have_content('Viewing Party Details for')
      expect(page).to have_field(:duration, with: movie.runtime)
      expect(page).to have_field(:time)
      expect(page).to have_field(:date)
      expect(page).to have_content(@friend_1.full_name)
      expect(page).to have_content(@friend_2.full_name)
      expect(page).to have_content(@friend_3.full_name)
      expect(page).to_not have_content(@friend_4.full_name)
      expect(page).to have_button('Create Party')
    end

    it 'creates new party', :vcr do
      movie = MovieFacade.movie_info_by_id(337404)
      visit '/parties/new?movie_id=337404'

      fill_in 'duration', with: '200'
      fill_in :date, with: '10/20/2023'
      fill_in :time, with: '05:00 PM'
      check "invited[]", with: @friend_1.id
      check "invited[]", with: @friend_2.id

      click_on 'Create Party'

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content('Party has been created successfully. Have fun!')

      within('#parties') do
        expect(page).to have_content(movie.title)
        expect(page).to have_content(@friend_1.full_name)
        expect(page).to have_content(@friend_2.full_name)
        expect(page).to_not have_content(@friend_3.full_name)
      end
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
