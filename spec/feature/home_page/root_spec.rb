require 'rails_helper'
require 'spec_helper'

RSpec.describe 'Home page' do
  it "When a user visit's the root page, they see a welcome" do

      visit "/"
      expect(page).to have_content("Welcome!")
  end
end
