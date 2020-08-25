class ViewingParties < ApplicationRecord
  validates :title, :date, :time, :duration, :poster, presence: true
  belongs_to :user


end
