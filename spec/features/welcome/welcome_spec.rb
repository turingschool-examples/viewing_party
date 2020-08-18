require 'rails_helper'

RSpec.describe "as a user" do
  it "can visit welcome and see descrition" do
    visit '/'
    expect(page).to have_content('viewing party app')
  end
end

