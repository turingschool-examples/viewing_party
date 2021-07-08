require 'rails_helper'

RSpec.describe "Welcome Page" do
  describe "Weclome Page and Log In via root path" do
    before :each do
      visit root_path
    end

    it 'it displays a welcome message and app description to the user' do
      welcome_message = "Welcome to Viewing Party!"
      description = "Remove the pysical barrier of distance and watch movies with your friends, from anywhere in the world!"

      expect(page).to have_content(welcome_message)
      expect(page).to have_content(description)
    end

    it 'it displays a log in form with button for registered users' do
      user = User.create!(email: 'empanada_luvr@email.com', password: 'hocuspocus')
      within("registered-users") do
        expect(page).to have_content("I already have an account, log me in!")
        expect(page).to have_button('Log In')

        fill_in :email, with: user.email
        fill_in :password, with: user.password

        click_button('Log In')
        expect(current_path).to eq(dashboard_path)
        #double check which route we want
      end
    end

# save_and_open_page
    xit 'it displays a registration link with desctiption for new users' do
      within("message") do
        expect(page).to have_content("I want this service, sign me up!")
        click_button('Register')
        expect(current_path).to eq(register_path)
      end
    end
  end
end

# When a user visits the root path they should be on the welcome page which includes:
#
#  Welcome message
#  Brief description of the application
#  Button to Log in
#  Link to Registration
# Details: Implement basic auth in the application allowing a user to log in with an email and password.
# The password should be stored in the database using bcrypt.


# <% if current_user %>
#     <%= button_to "Log out", '/logout', method: :delete %>
# <% else %>
#     <p>I want this service, sign me up!</p>
#     <%= button_to "Register", "/register" %>
#     <p>I already have an account, log me in!</p>
#     <%= button_to "Login", "/login" %>
# <% end %>
