require 'rails_helper'

RSpec.describe 'session login page' do
  context "you want to login to the app" do

    before :each do
      visit login_path
    end

    it "allows existing user to login" do
      user = User.create!(email: "#{Faker::Internet.email}", password: "#{Faker::Internet.password}", name: "devin")

      fill_in :email, with: "#{user.email}"
      fill_in :password, with: "#{user.password}"

      click_on("Login")
      expect(current_path).to eq(root_path)
    end

    it "requires existing user" do
      user = User.new(email: "#{Faker::Internet.email}", password: "#{Faker::Internet.password}", name: "devin")

      fill_in :email, with: "#{user.email}"
      fill_in :password, with: "#{user.password}"

      click_on("Login")
      expect(current_path).to eq(login_path)
      expect(page).to have_content("Your email or password is Incorrect")
    end

  end
end
