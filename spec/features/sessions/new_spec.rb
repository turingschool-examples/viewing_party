require 'rails_helper'

RSpec.describe 'User login new page', type: :feature do
  before :each do
    @user = User.create!(full_name: 'Andrew J', email: 'example@email.com', password: 'test')
  end

  it 'i can login after entering the correct information' do
    visit login_path

    fill_in :email, with: @user.email
    fill_in :password, with: 'test'

    click_on 'Log In'

    expect(current_path).to eq(user_dashboard_index_path(@user))
  end

  it 'renders new again if the information doesnt match a user' do
    visit login_path

    fill_in :email, with: @user.email
    fill_in :password, with: 'password'

    click_on 'Log In'

    expect(page).to have_content("Credentials do not match")

    visit login_path

    fill_in :email, with: 'example@example.com'
    fill_in :password, with: 'test'

    click_on 'Log In'

    expect(page).to have_content("Credentials do not match")
  end
end
