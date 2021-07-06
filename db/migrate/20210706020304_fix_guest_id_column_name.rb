class FixGuestIdColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :party_guests, :user_id, :guest_id
  end
end
