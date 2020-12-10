class Party < ApplicationRecord
  belongs_to :user
  has_many :guests
  has_many :users, through: :guests

  def convert_time
    if !start_time.nil?
      start_time.to_time.strftime("%l:%M %p")
    end
  end

  def convert_date
    if !day.nil?
      day.strftime("%-m/%-d/%Y")
    end
  end
end
