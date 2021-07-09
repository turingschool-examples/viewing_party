require 'rails_helper'

RSpec.describe "Welcome Page" do
  describe 'logging in' do
    before :each do
      user = User.create!(email: 'empanada_luvr@email.com', password: 'hocuspocus')
      visit root_path
    end

    it 'it allows registered users to log in with correct credentials' do
      click_link 'Log me in!'
      fill_in :email, with: 'empanada_luvr@email.com'
      fill_in :password, with: 'hocuspocus'
      click_button('Log In')

      expect(current_path).to eq(root_path)
      expect(page).to have_content('Welcome back, empanada_luvr@email.com')
      expect(page).to_not have_content("I already have an account")
      expect(page).to_not have_link("Log me in!")
      expect(page).to_not have_link("Register")
      expect(page).to have_button("Log out")
    end
  end
end
