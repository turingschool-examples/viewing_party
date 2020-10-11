require 'rails_helper'

RSpec.describe 'New viewing party' do
  describe 'As a Visitor' do
    before :each do
      @user = User.create(name: 'Jackie Chan', email: 'a@a.com', password: 'a', password_confirmation: 'a')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    end
    
    describe "When I visit a new viewing party page for" do
      it "I see a form with an un-editable field containing a movie title" do

        visit "/new_party/#{@user.id}/princess_mononoke"

      end
    end
  end
end
