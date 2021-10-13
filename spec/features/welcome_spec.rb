require "rails_helper"

RSpec.describe "Welcome Page" do
  before :each do
    @user = User.create!(email: "test123@xyz.com", password: "banana", first_name: "James", last_name: "Doe")

    visit root_path
  end

  describe "logging in" do
    it "displays all fields of attributes" do

      expect(page).to have_field(:email)
      expect(page).to have_field(:password)
      expect(page).to have_field(:first_name)
      expect(page).to have_field(:last_name)
    end

    it "can log in with valid credentials" do

      fill_in :email, with: @user.email
      fill_in :password, with: @user.password
      fill_in :first_name, with: @user.first_name
      fill_in :last_name, with: @user.last_name

      click_on "Sign In"

      expect(current_path).to eq(user_path(@user))

      expect(page).to have_content("Welcome, #{@user.first_name}!")
    end

    it "cannot log in with bad credentials" do

      fill_in :email, with: @user.email
      fill_in :password, with: "apple"
      fill_in :first_name, with: @user.first_name
      fill_in :last_name, with: @user.last_name

      click_on "Sign In"

      expect(current_path).to eq(root_path)

      expect(page).to have_content("Error: Please make sure your credentials are correct.")
    end
  end
end
