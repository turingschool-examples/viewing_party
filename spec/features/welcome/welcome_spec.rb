require 'rails_helper'

RSpec.describe "as a user" do
  it "can visit welcome and see descrition" do
    visit '/'
    expect(page).to have_content('viewing party app')
  end
end
# As a user,
# When I visit the root path,
# I should see a welcome page with a brief description of the application.
