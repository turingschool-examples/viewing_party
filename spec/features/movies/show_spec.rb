require 'rails_helper'

RSpec.describe "Movies Show Page" do
  before :each do 
    @user = User.create(password: "hello", email: "sample@email.com")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end
  describe "When I visit the movie's detail page as a logged in user" do
    it "displays the logged in user email" do
      visit movie_path(550)
      within "#userInfo" do
        expect(page).to have_content("Welcome #{@user.email}!")
      end
    end
  end
end