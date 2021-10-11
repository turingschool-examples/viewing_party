require 'rails_helper'

RSpec.describe UserShowing do
  describe 'relationships' do
    it {should belong_to(:user)}
    it {should belong_to(:showing)}
  end
end
