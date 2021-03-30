class GuestList < ApplicationRecord
  belongs_to :user
  belongs_to :party

  def self.make_guest_list(id_collection, party_id)
    id_collection.map do |id|
      GuestList.create(user_id: id, party_id: party_id)
    end
  end
end
