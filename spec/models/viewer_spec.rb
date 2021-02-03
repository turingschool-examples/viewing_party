require 'rails_helper'

RSpec.describe Viewer do
  it { should validate_presence_of :party }
  it { should validate_presence_of :user }
  it { should validate_presence_of :status }

  it {should belong_to :user }
  it {should belong_to :party }
end
