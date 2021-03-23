require 'rails_helper'

RSpec.describe "Dashboard" do
  before :each do
    @user = User.create!(name: "name", email: "email@gmail.com", password: "password")
    visit root_path

      within(".login") do
        fill_in :email, with: @user.email
        fill_in :password, with: @user.password
        click_button("Log In")
      end
  end

  describe "when I visit a user dashboard it" do
    it "has a welcome header" do
      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Welcome #{@user.name}!")
    end
  end
end
