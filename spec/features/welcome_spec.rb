require "rails_helper"

RSpec.describe "Welcome Page" do
  before :each do
    @user = User.create!(email: "test123@xyz.com", password: "banana", first_name: "James", last_name: "Doe")

    visit welcome_path
  end

  describe "logging in" do
    it  do
    end
  end
end
