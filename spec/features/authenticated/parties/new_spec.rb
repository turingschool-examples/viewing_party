require 'rails_helper'

RSpec.describe "Parties New form" do
  before(:each)do
    @user = User.create(email: 'test123@xyz.com', password: 'viewparty')
    visit welcome_path
    fill_in :email, with: "test123@xyz.com"
    fill_in :password, with: "viewparty"
    click_button "Sign In"
    visit "/movies/337404"
    click_on "Create Viewing Party"
  end
  
  context "if user has no friends" do 
    it "creates a party" do 
    
      fill_in 'date', with: '12/12/21'
      fill_in 'start_time', with: '5:00 PM'
      click_on "Create Party"

      expect(current_path).to eq(dashboard_path)
    end
  end
end