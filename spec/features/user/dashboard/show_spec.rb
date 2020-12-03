require 'rails_helper'


feature 'As a user' do
  given!(:user) {@user = create(:user)}
  describe 'when i visit my dashboard, I will see' do
    before(:each) do
      @viewing1 = create(:viewing)
      @viewing2 = create(:viewing)
      @viewing3 = create(:viewing)
    end

    it 'I see a link to discover movies' do
    end
  end
end
