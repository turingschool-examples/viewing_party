require 'rails_helper'

RSpec.describe "the dashboard", :vcr do
  before(:each) do
    @user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    visit dashboard_index_path
  end

  describe 'display' do
    it 'shows welcome message to the user' do
      expect(page).to have_content("Welcome #{@user.email}!")
    end

    it 'shows link to discover movies and links to the discover page' do
      expect(page).to have_link('Discover Movies')

      click_link 'Discover Movies'

      expect(current_path).to eq(discover_index_path)
    end
  end

  describe 'friends' do
    it 'displays no friends message when no friends' do
      within("#friends") do
        expect(page).to have_content('You currently have no friends')
      end
    end

    it 'can add a friend' do
      user_2 = create(:user)
      email_1 = user_2.email


      within("#friends") do
        expect(page).to_not have_content(email_1)

        within("#add_friend") do
          fill_in 'email', with: email_1
          click_button 'Add friend'
        end
      end

      expect(current_path).to eq(dashboard_index_path)

      within("#friends") do
        expect(page).to have_content(email_1)
      end

      user_3 = create(:user)
      email_2 = user_3.email

      within("#add_friend") do
        fill_in 'email', with: email_2
        click_button 'Add friend'
      end

      updated_user = User.find(@user.id)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(updated_user)

      visit dashboard_index_path

      within("#friends") do
        expect(page).to have_content(email_1)
        expect(page).to have_content(email_2)
      end
    end

    it 'add friend sad path' do
      user_2 = create(:user)
      email = user_2.email

      within("#add_friend") do
        fill_in 'email', with: 'error@test.com'
        click_button 'Add friend'
      end

      expect(current_path).to eq(dashboard_index_path)
      expect(page).to have_content('No user by this email!')
    end
  end
end
