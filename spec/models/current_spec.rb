require 'rails_helper'

RSpec.describe Current, type: :model do
  it 'is a user' do
    @user = User.create(email: "ely@me.com", password: "password")
    
    allow_any_instance_of(Current).to receive(:user).and_return(@user)
    expect(Current.user).to eq(@user)
  end
end