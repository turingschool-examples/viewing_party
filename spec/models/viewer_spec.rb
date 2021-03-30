require 'rails_helper'

RSpec.describe Viewer, type: :model do
  describe 'relationships' do
    it {should belong_to :user}
    it {should belong_to :viewing_event}
  end
end
