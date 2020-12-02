require 'rails_helper'

describe "Welcome Page:" do
  it 'it has a welcome message and description' do
    visit '/'

    expect(page).to have_content("Welcome to Viewing Party!")
    expect(page).to have_content("Description")
  end
end
