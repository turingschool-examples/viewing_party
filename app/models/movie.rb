class Movie < ApplicationRecord
    validates :mdb_id, presence: true, uniqueness: true

    has_many :parties
    # has_many :viewers, through: :viewing_parties
end
