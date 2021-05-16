class ChangeUserViewingPartiesToUserParties < ActiveRecord::Migration[5.2]
  def change
    rename_table :user_viewing_parties, :user_parties
  end
end
