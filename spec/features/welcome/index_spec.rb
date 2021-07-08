require 'rails_helper'

RSpec.describe "Welcome Page" do
  describe 'welcome message' do
    it 'has a welcome message and description' do
      visit root_path

      expect(page).to have_content('Welcome to our Viewing Party App')
      expect(page).to have_content('This app allows you to create a viewing party to watch a movie with your friends!')
    end
  end

  describe 'log in button' do
    it 'has a log in button' do
      visit root_path
      
      expect(page).to have_button('Log in')
    end
  end

  describe 'link to register' do
    it 'has a link to registration' do
      visit root_path

      expect(page).to have_link('Link to Registration')
    end
  end
end
