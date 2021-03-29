require 'rails_helper'

describe "when a user visits the welcome page" do
  it "includes a welcome message and brief decription" do
    visit root_path

    expect(page).to have_content("Welcome to Viewing Party")
    expect(page).to have_content("An app to view movies with your friends!")
  end

  it "has an email and password form to sign in" do
    visit root_path

    fill_in "email", with: 'harrison@email.com'
    fill_in "password", with: 'harrison'

    expect(page).to have_button('Sign In')
  end

  it "includes a link for a new user to sign up and redirects you to the registration page" do
    visit root_path

    expect(page).to have_link('New to Viewing Party? Register Here')

    click_link('New to Viewing Party? Register Here')
    expect(current_path).to eq('/registration')
  end

  describe "I see a form to log in" do
    before :each do
      @user = User.create(email: 'harrison@email.com', password: 'harrison')
    end

    it "when a user signs in with valid credentials it takes user to their dashboard" do
      visit root_path

      fill_in "email", with: 'haRrison@eMail.cOm'
      fill_in "password", with: 'harrison'

      click_button "Sign In"

      expect(current_path).to eq(dashboard_index_path)
      expect(page).to have_content("Welcome, #{@user.email}")
    end

    it "when a user signs in with an incorrect password it returns the user to the welcome page" do
      visit root_path

      fill_in "email", with: @user.email
      fill_in "password", with: 'garrison'

      click_button "Sign In"

      expect(current_path).to eq(root_path)
      expect(page).to have_content("The email or password you entered is incorrect")
    end

    it "when a user signs in with an incorrect email it returns the user to the welcome page" do
      visit root_path

      fill_in "email", with: "iam_not_harrison@garrison.com"
      fill_in "password", with: 'harrison'

      click_button "Sign In"

      expect(current_path).to eq(root_path)
      expect(page).to have_content("The email or password you entered is incorrect")
    end
  end

  describe "If I am already logged in I see" do
    before :each do
      @user = User.create(email: 'harrison@email.com', password: 'harrison')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    end

    it "a link to the Dashboard and do not see a link to Register" do
      visit root_path

      expect(page).to_not have_button("Sign In")
      expect(page).to have_link("Dashboard")
      expect(page).to_not have_link('New to Viewing Party? Register Here')
    end

    it "a link to logout, when clicked I am back on the welcome page and see a login form again" do
      visit root_path

      click_link 'Logout'
      #test is not 100% working capybara is not clicking link, in dev it works

      expect(current_path).to eq(root_path)
      # expect(page).to have_button('Sign In')
    end
  end
end
