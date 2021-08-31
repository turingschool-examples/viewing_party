require 'rails_helper'

RSpec.describe "new movie party", :type => :request do
  describe 'form' do
    it 'displays form to create movie party when filled out' do
      get new_party_path, params: {title: 'Lord of the Rings'}

      within('#form') do
        expect(page).to have_content 'Movie Title'
        expect(page).to have_content 'Lord of the Rings'
      end
    end
  end
end
