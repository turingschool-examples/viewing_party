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
       expect(last_user.email).to eq(email)
       expect(last_user.password_digest).to eq(password)
     end
   end
 end
