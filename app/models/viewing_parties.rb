class ViewingParties < ApplicationRecord
  validates :title, :date, :runtime, :poster, presence: true
  belongs_to :user
end
