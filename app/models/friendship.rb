class Friendship < ApplicationRecord
    belongs_to :user
    belongs_to :friend, class_name: "User"
    validates_uniqueness_of :friend, scope: :user
    validate :check_user


    def check_user
        errors.add(:friend, "can't be yourself") if self.friend_id == self.user_id
    end

    

end
