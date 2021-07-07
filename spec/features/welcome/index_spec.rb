require 'rails_helper'

RSpec.describe "welcome page" do
  before :each do
    visit root_path
  end

  it 'shows a welcome message' do
    expect(page).to have_content("Welcome to Viewing Party!")
  end

  it 'has a brief description of the application' do
    expect(page).to have_content("Browse movies, create viewing partys, and invite friends!!!")
  end

  it 'has a link to register user' do
    click_link 'Register here'

    expect(current_path).to eq('/register')
  end
end