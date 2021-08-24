require 'rails_helper'

RSpec.describe 'home page' do
  describe 'contents' do
    it 'can login to application' do
      user = create(:user)

      visit '/'

      expect(page).to have_content('Welcome to Viewing Party')

      fill_in 'email', with: user.email
      fill_in 'password', with: user.password_digest
      click_on 'Sign In'

      expect(current_path).to eq('/dashboard')
    end
  end
end
