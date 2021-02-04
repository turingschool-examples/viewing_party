require 'rails_helper'

RSpec.describe('Dashboard') do
  describe 'happy path' do
    before :each do
      visit dashboard_path
    end

    it "should display 'Welcome <username>!' at the top of page" do
      skip
      expect(page).to have_content('Welcome Ryan!')
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
