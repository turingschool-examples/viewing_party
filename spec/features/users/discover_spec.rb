require 'rails_helper'

RSpec.describe 'user can discover movies', type: :feature do
  describe 'as a user' do
    it 'i see 40 movies on the discover page' do
      visit discover_path



    end
  end
end
