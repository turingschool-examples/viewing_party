require 'rails_helper'

RSpec.describe "Welcome Page" do 
  it "should have welcome message, description of app, button to log on, link to register" do 
    visit root_path

    within("#welcome") do 
      expect(page).to have_content("Welcome to Viewing Party!")
    end
    
    within("#description") do
      expect(page).to have_content("Viewing Party allows you to host or attend virtual movie parties!")
      
    end

    expect(page).to have_link("Log In!")
    expect(page).to have_link("Click here to register!")
  end
end