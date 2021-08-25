require 'rails_helper'

 RSpec.describe 'new user registration' do
   describe 'new user' do
     it 'can create a new user' do
       email = '123@example.com'
       password = 'password'

       visit '/'

       click_on 'New to Viewing Party? Register Here'
       expect(current_path).to eq('/register')

       # add sad path for not having the same password
       fill_in :email, with: email
       fill_in :password, with: password
       fill_in :password_confirmation, with: password
       click_on 'Register'

       last_user = User.last
       expect(current_path).to eq('/dashboard')
       expect(page).to have_content("Welcome #{last_user.email}!")
       expect(last_user.email).to eq(email)
       expect(last_user.password_digest).to_not eq(password)
     end

     it 'does not create a new user and gives a sad path' do
      email = '123@example.com'
      password = 'password'

      visit '/'

      click_on 'New to Viewing Party? Register Here'

      # add sad path for not having the same password
      fill_in :email, with: email
      fill_in :password, with: ''
      fill_in :password_confirmation, with: ''
      click_on 'Register'

      expect(current_path).to eq('/register')
      expect(page).to have_content("Sorry, your credentials are bad.")
     end
   end
 end
