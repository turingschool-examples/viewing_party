require 'rails_helper'

RSpec.describe 'Friends' do
  let(:user) { create(:user) }

  describe 'dashboard' do
    it 'Should default to no friends' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit '/dashboard'

      expect(page).to have_content('Your Friends:')
      expect(page).to have_content('You currently have no friends.')
      expect(page).to have_field('friend_email')
      expect(page).to have_button('Add Friend')
    end
  end
  describe 'adding friends' do
    describe 'adding a valid friend' do
      it 'add the friend to the friends section' do
        user_1 = User.create!(email: 'tester_1@turing.orb', password: 'testing')
        user_2 = User.create!(email: 'tester_2@turing.orb', password: 'testing')
        user_3 = User.create!(email: 'tester_3@turing.orb', password: 'testing')
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)
        
        visit '/dashboard'

        fill_in 'friend_email', with: user_2.email
        click_on 'Add Friend'

        expect(page).to have_current_path('/dashboard')
        expect(page).to_not have_content('You currently have no friends')
        expect(page).to have_content('tester_2@turing.orb')
        expect(page).to have_content('Friend Added!')
        

        fill_in 'friend_email', with: user_3.email
        click_on 'Add Friend'

        expect(page).to have_current_path('/dashboard')
        expect(page).to_not have_content('You currently have no friends')
        expect(page).to have_content('tester_2@turing.orb')
        expect(page).to have_content('tester_3@turing.orb')
      end
    end
    describe 'adding a friend not on our service' do
      it 'returns to dashboard with an error' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit '/dashboard'

        fill_in 'friend_email', with: 'tester_2@turing.orb'
        click_on 'Add Friend'

        expect(page).to have_current_path('/dashboard')
        expect(page).to have_content('You currently have no friends')
        expect(page).to_not have_content('tester_2@turing.orb')
        expect(page).to have_content('Error, friend does not have an account.')
      end
    end
    describe 'adding yourself' do
      it 'returns to dashboard with an error' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit '/dashboard'

        fill_in 'friend_email', with: user.email
        click_on 'Add Friend'

        expect(page).to have_current_path('/dashboard')
        expect(page).to have_content('You currently have no friends')
        withing 'div#friends' do
          expect(page).to_not have_content(user.email)
        end 
        expect(page).to have_content('Error, cannot friend yourself.')
      end
    end
  end
end