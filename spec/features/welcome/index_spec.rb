require 'rails_helper'

RSpec.describe "Welcome path" do
  it "Displays a brief description of the application" do
    visit '/'

    expect(page).to have_content("Welcome To The Viewing Party!")
    expect(page).to have_content("Set up watch parties for your favorite movies with all your friends!")
  end
end
