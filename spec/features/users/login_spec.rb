require 'rails_helper'

describe "As a visitor" do
  describe "When I visit the home page to log in" do
    it "I enter valid information and am redirected to my dashboard" do
      user = User.create!(first_name: 'Zach',
                          last_name: 'Stearns',
                          email: 'zach@email.com', 
                          password: 'password')

      fill_in :email,	with: "#{user.email}"
      fill_in :password,	with: "#{user.password}"
      click_button 'Sign In'

      expect(current_path).to eq('/dashboard')
    end
  end
end
