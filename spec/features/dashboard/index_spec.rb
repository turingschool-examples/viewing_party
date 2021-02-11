require 'rails_helper'

RSpec.describe "Dashboard" do
  describe "as a logged in user (happy path)" do
    describe "the Friends panel" do
      before(:each) do
        visit root_path

        click_link("Register")
        
        fill_in(:"user[email]", with: "somedude@example.com")
        fill_in(:"user[password]", with: "password123")
        fill_in(:"user[password_confirmation]", with: "password123")
        click_button("Create Account")
      end
  
      it "has a list of user's friends" do
        user2 = User.create(email: "kelsey@email.org", password_digest: "dsaffsdsa")
        user3 = User.create(email: "bobby@email.org", password_digest: "axcver")
        user4 = User.create(email: "jane@email.org", password_digest: "dsarertgfffsdsa")
        user5 = User.create(email: "elisa@email.org", password_digest: "eutkjgkx")

        within("#friends-panel") do
          expect(page).to have_content(user2.email)
          expect(page).to have_content(user3.email)
          expect(page).to have_content(user4.email)
          expect(page).to have_content(user5.email)
        end
      end
  
      it "section to add friends" do

      end

      it "tells a user they have no friends if they have zero" do
  
      end
    end

  end
end