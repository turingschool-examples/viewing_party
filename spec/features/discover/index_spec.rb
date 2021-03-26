require 'rails_helper'

RSpec.describe "Discover index page" do
  describe "As an unauthenticated user" do
    describe "when i visit the discover index page" do
      it "redirects me to the login page with a flash message" do
        visit discover_path

        expect(current_path).to eq(root_path)
        expect(page).to have_content("You must be logged in to view this page")
      end
    end
  end
end
