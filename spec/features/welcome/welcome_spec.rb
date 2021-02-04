require 'rails_helper'

RSpec.describe "welcome page" do
  describe "happy path" do
    describe "as a user" do
      before do
        @existing_user = User.create!({:email => "adam_smith@example.com", :password => "supertopsecret1"})
        @new_user = {:email => "johnny_doe@example.com", :password => "supersecret123"}
        visit root_path
      end
      
      it "has a welcome message and a brief description of the application" do
        within('#welcome-banner-section') do
          expect(page).to have_content("Welcome to Viewing Party")
        end
  
        within('#welcome-blurb-section') do
          expect(page).to have_content("Hello there! Welcome to Viewing Party, a place friends to plan watch parties for all your favorite movies. We believe you're the customer, not the product! All of your data is stored securely and will never be sold. Let's get the show on the road!")
        end
      end
  
      it "has a log in section and a link to the registration page" do
        within("#log-in-section") do
          expect(page).to have_field("email")
          expect(page).to have_field("password")
        end
      end

      it "allows existing users to login" do
        within("#log-in-section") do
          fill_in "email", with: "adam_smith@example.com"
          fill_in "password", with: "supertopsecret1"
          click_on "Log In"
        end

        expect(current_path).to eq(root_path)
save_and_open_page
        # add testing for post-login welcome page
      end

      it "has a link to the registration page" do
        within("#log-in-section") do
          click_link("New to Viewing Party? Register Here")
        end

        expect(current_path).to eq(new_user_path)
      end
    end
  end
end