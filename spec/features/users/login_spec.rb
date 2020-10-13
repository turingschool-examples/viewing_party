require 'rails_helper'

RSpec.describe 'User welcome page', type: :feature do
  describe 'As a visitor' do
      it 'I can login successfully from welcome page' do
          user = create :user
    
          visit '/'
    
          fill_in 'Email', with: user.email
          fill_in 'Password', with: user.password
    
          click_on 'Log in'
    
          expect(page).to have_content("Now logged in as #{user.email}!")
          expect(current_path).to eq('/dashboard')
      end

      it 'I can flash an error if unsuccessful logging in' do
          user = create :user
    
          visit '/'
    
          fill_in 'Email', with: 'jimbob@email.com'
          fill_in 'Password', with: 'password'
    
          click_on 'Log in'
    
          expect(page).to have_content("That email/password combination does not exist in our records")
          expect(current_path).to eq('/')
      end
    end
  end