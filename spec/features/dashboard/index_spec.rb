require 'rails_helper'

RSpec.describe('Dashboard') do
  describe 'happy path' do
    describe 'as an authenticated user' do
      before :each do
        @user = User.create(name: 'Buffy', email: "buffyslayer@example.com", password: "test")

        visit login_path

        fill_in :email, with: @user.email.upcase
        fill_in :name, with: @user.name.upcase
        fill_in :password, with: @user.password

        click_button 'Log In'

        # Logging In Redirects to Dashboard
      end

      it "should display 'Welcome <username>!' at the top of page" do
        expect(page).to have_content("Welcome, #{@user.name}")
      end

      it "should have a button to 'Discover Movies'" do
        expect(page).to have_button('Discover Movies')
      end

      it 'should have a friends section' do
        expect(page).to have_content('My Friends:')
        expect(page).to have_selector("section[class='friends']")
      end

      it 'should have a viewing parties section' do
        expect(page).to have_content('My Viewing Parties:')
        expect(page).to have_selector("section[class='viewing-parties']")
      end

      describe "when a user clicks the 'Discover Movies' button" do
        it 'they should be taken to the discover movies page /discover' do
          click_button 'Discover Movies'

          expect(current_path).to eq(discover_path)
        end
      end
    end
  end

  describe 'sad path' do
    describe 'when I am NOT an authenticated user' do
      before :each do
        visit dashboard_path
      end

      it 'should redirect back to the log in page' do
        expect(current_path).to eq(login_path)
      end

      it "should give a 'You Must Log In To Visit Your Dashboard' notice" do
        expect(page).to have_content('You Must Log In To Visit Your Dashboard')
      end
    end
  end
end
