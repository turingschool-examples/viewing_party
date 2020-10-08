require 'rails_helper'

RSpec.describe "User Dashboard: Discover Movies" do
  before :each do
    @user = User.create!(email: 'tony@stark.com', password: '1234')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit user_dashboard_path(@user.id)
  end

  it "Discover movies button takes me discover page" do
    click_button 'Discover Movies'
    expect(current_path).to eq(discover_path)
    expect(page).to have_button('Top 40 Movies')
    expect(page).to have_field(:find_movies)
    expect(page).to have_button('Find Movies')
  end
end
