require 'rails_helper'

RSpec.describe "as a user" do
  it "I can visit welcome and see descrition" do
    visit '/'

    expect(page).to have_content('Viewing Party App')
    expect(page).to have_button('Log In with Google')
  end
end
