class UserShowing < ApplicationRecord
  belongs_to :user
  belongs_to :showing 
end
