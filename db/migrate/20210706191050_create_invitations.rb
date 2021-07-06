class CreateInvitations < ActiveRecord::Migration[5.2]
  def change
    create_table :invitations do |t|
      t.references :party, foreign_key: true
      t.integer :invitee_id
    end
  end
end
