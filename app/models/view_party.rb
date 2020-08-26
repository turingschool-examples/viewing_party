class ViewParty < ApplicationRecord
  validates_presence_of :movie_title,
                        :date,
                        :time,
                        :runtime

  has_many :user_view_parties
  has_many :users, through: :user_view_parties

  def start_time
    
  end


  def end_time

  end

end
