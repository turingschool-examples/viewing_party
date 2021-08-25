require 'rails_helper'
 RSpec.describe 'it can show details on a users dashboard' do
   before :each do

    visit "/dashboard"
   end

   it 'expect page to have link discover movies' do
    expect(page).to have_link('Discover Movies')

    click_link('Discover Movies')

    expect(current_path).to eq('/discover')
   end
 end
