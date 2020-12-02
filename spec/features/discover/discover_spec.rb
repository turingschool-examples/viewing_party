require 'rails_helper'

describe 'As a user' do
  before :each do
    @user_1 = User.create(email: 'test@gmail.com', password: 'test', first_name: 'Alex', last_name: 'Rivero')
  end

  it 'when I visit /discover' do
    visit '/discover'

    expect(page).to have_content("Welcome #{@user_1.first_name} #{@user_1.last_name}")

    expect(page).to have_button('Find Top Rated Movies')
    expect(page).to have_button('Find Movies')
  end
end
