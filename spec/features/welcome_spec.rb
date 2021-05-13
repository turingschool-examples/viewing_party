require 'rails_helper'

RSpec.describe 'welcome index page' do
  it 'shows welcome info' do
    visit root_path
    expect(page).to have_content('Welcome!')
    expect(page).to have_content('This is the description')
    expect(page).to have_link('Log In')
    expect(page).to have_link('Register As A User')
  end
end
