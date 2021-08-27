require 'rails_helper'

RSpec.describe "the dashboard" do
  before(:each) do
    @user = User.create!(email: 'test@test.com', password: 'pswd')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    visit dashboard_index_path
  end

  describe 'display' do
    it 'displays welcome message to the user' do
      expect(page).to have_content("Welcome #{@user.email}!")
    end

    it 'displays link to discover movies' do
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
      email = 'friend_1@email.com'
      user_2 = User.create!(email: email, password: 'pswd')
      
      within("#friends") do
        expect(page).to_not have_content(email)

        within("#add_friend") do
          fill_in 'email', with: email
          click_button 'Add friend'
        end
      end

      expect(current_path).to eq(dashboard_index_path)

      within("#friends") do
        expect(page).to have_content(email)
      end
    end
  end
end
