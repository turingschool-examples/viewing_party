class ChangeViewingPartyIdToPartyId < ActiveRecord::Migration[5.2]
  def change
    rename_column :attendees, :viewing_party_id, :party_id
  end
end
