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

    it 'it displays login but that redirects to login page' do
      current_user = User.create!(email: 'empanada_luvr@email.com', password: 'hocuspocus')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@current_user)

      expect(page).to have_content("I already have an account.")
      expect(page).to have_button('Log me in!')

      click_button('Log me in!')
      expect(current_path).to eq('/login')
    end

    it 'it displays a registration link with desctiption for new users' do

        expect(page).to have_content("I want this service, sign me up!")
        click_link('Register')
        expect(current_path).to eq("/registration")
      end
    end
  end
