require 'rails_helper'

describe "User registration form" do
  it "creates new user" do
    visit root_path

    click_link "Register"

    expect(current_path).to eq(new_user_path)

    email = "joeb@email.com"
    password = "test"

    fill_in 'user[email]', with: email
    fill_in 'user[password]', with: password

    click_on "Create User"

    expect(page).to have_content("Welcome, #{email}!")
  end
  
  describe 'sad path' do
    it 'block login if bad credentials' do
      user = User.create(email: "funbucket13@example.com", password: "test")

      visit root_path

      click_link 'Register'

      expect(current_path).to eq(login_path)

      fill_in :email, with: user.email
      fill_in :password, with: 'bad password'

      click_button 'Login'

      expect(current_path).to eq(login_path)
      expect(page).to have_content("Wrong email/password")
    end
  end
end