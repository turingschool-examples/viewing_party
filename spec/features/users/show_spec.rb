require 'rails_helper'
RSpec.describe 'user dashboard page' do
  before(:each) do
    @user = create(:mock_user)
    @friend_1 = create(:mock_user)
    @friend_2 = create(:mock_user)
    # @friendship_2 = create(:mock_friendship, user: @user, friend: @friend_2)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  describe 'friendships' do
    context 'has no friends to display' do
      it 'displays no friends if no friends' do
        visit dashboard_path
        within('#friends') do
          expect(page).to have_content("You currently have no friends")
        end
      end
    end
    context 'has friends to display' do
      it 'displays friend names' do
        friendship_1 = create(:mock_friendship, user: @user, friend: @friend_1)
        visit dashboard_path
        within('#friends') do
          expect(page).to have_content(@friend_1.full_name)
          expect(page).to_not have_content(@friend_2.full_name)
        end
      end
    end
  end
end
