require 'rails_helper'

RSpec.describe 'registration page' do
  describe 'as a visitor' do
    describe 'happy path' do
      it 'allows me to register for an account' do
        visit new_user_path

        fill_in 'user[email]', with: 'me@gmail.com'
        fill_in 'user[password]', with: 'password'
        fill_in 'user[password_confirmation]', with: 'password'

        click_on 'Create User'

        expect(current_path).to eq(dashboard_path)
        expect(page).to have_content('Your account has been successfully created.')
      end
    end

    describe 'sad path' do
      it 'requires valid email address' do
        visit new_user_path

        fill_in 'user[email]', with: '1a'
        fill_in 'user[password]', with: 'password'
        fill_in 'user[password_confirmation]', with: 'password'

        click_on 'Create User'

        expect(page).to have_content('you must use a valid email address')
      end

      it 'does not allow a blank password' do
        visit new_user_path

        fill_in 'user[email]', with: 'robert@me.com'

        click_on 'Create User'

        expect(page).to have_content("Password can't be blank")
      end

      it 'requires matching passwords' do
        visit new_user_path

        fill_in 'user[email]', with: 'rob@me.com'
        fill_in 'user[password]', with: 'password'
        fill_in 'user[password_confirmation]', with: 'password confirmation'

        click_on 'Create User'

        expect(page).to have_content("Password confirmation doesn't match Password")
      end
    end
  end
end
