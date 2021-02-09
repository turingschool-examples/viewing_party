require 'rails_helper'

describe 'on the party creation page', :vcr do
  before :each do
    @user = User.create(email: "ely@me.com", password: "password")
    allow_any_instance_of(Current).to receive(:user).and_return(@user)

    visit movie_path(330457)
    click_button 'Create Movie Party'
  end

  it 'has a form to create a new party' do

    expect(page).to have_field('party[name]', with: 'Frozen ii')
    expect(page).to have_field('party[duration]', with: 104)
    expect(page).to have_field('party[datetime]')
    expect(page).to have_button('Create Party')
  end

  it 'displays an error if a field is left blank' do
    click_button 'Create Party'

    expect(page).to have_content('datetime required')
  end

end
