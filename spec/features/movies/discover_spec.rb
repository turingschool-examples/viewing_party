require 'rails_helper'

RSpec.describe 'Movies Discover Page' do
  context 'Need to Log In first' do
    describe 'need to login' do
      it 'can displays an error message and redirect user if not logged in or have no account' do
        visit discover_path

        expect(current_path).to eq(new_user_path)
        expect(page).to have_content('Please login in or register an account.')
      end
    end
  end

  context 'Features After Logged In' do
    before :each do
      @user = create(:mock_user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    end
    describe 'Discover Page' do
      it 'displays all search features, go back to dashboard and logout' do
        visit discover_path

        expect(page).to have_button('Find Top Rated Movies')
        expect(page).to have_content('OR')
        expect(page).to have_field('Search by movie title')
        expect(page).to have_button('Find Movies')

        expect(page).to have_link('Dashboard')
        expect(page).to have_link('Log Out')
      end
    end
  end
end
