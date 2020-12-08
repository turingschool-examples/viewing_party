class RenameViewingPartyIdToPartyId < ActiveRecord::Migration[5.2]
  def change
    change_table :guests do |t|
      t.rename :viewing_party_id, :party_id
    end
  end
end
