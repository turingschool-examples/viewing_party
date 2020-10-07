require 'rails_helper'


RSpec.describe "User Dashboard" do
  it "I should see welcome line" do
    @user = User.create!(email: 'tony@stark.com', password: '1234')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit user_dashboard_path(@user.id)

    expect(page).to have_content("Welcome #{@user.email}!")
    expect(page).to have_button("Discover Movies")
    expect(page).to have_css('.friends')
    expect(page).to have_css('.viewing_parties')
  end
end
