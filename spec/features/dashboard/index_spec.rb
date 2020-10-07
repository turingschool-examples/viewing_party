require 'rails_helper'

RSpec.describe 'user dashboard' do
  it 'as a user, after logging in, I see a welcome message with my username' do
    user = User.create!(username: 'Username', email: 'testing123@gmail.com', password: 'password')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/dashboard"

    expect(page).to have_content("Welcome #{user.username}!")


  end
end
