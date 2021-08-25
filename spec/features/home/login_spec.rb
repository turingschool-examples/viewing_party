require 'rails_helper'

RSpec.describe 'home page' do
  describe 'contents' do
    it 'can login to application' do
      user = create(:user)

      visit '/'

      expect(page).to have_content('Welcome to Viewing Party')
      
      fill_in 'email', with: user.email
      fill_in 'password', with: user.password
      click_on 'Sign In'

      expect(current_path).to eq('/dashboard')
    end

    it 'can not log in and tells the user there was an issue' do
      user = create(:user)

      visit '/'
      
      fill_in 'email', with: user.email
      fill_in 'password', with: ''
      click_on 'Sign In'
      
      expect(current_path).to eq('/')
      expect(page).to have_content('Sorry, your credentials are bad.')
    end
  end
end
