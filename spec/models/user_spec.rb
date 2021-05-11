require 'rails_helper'

RSpec.describe User do 
    describe 'validations' do 
        it {should validate_presence_of :user_name}
        it {should validate_uniqueness_of :user_name}
        it {should validate_presence_of :password_digest}
        it {should validate_confirmation_of :password}
    end 
end 