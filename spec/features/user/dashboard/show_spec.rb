require 'rails_helper'


feature 'As a user' do
  given!(:user) {@user = create(:user)}
  describe 'when i visit my dashboard, I will see' do
    it 'I see a link to discover movies' do
    end
  end
end
