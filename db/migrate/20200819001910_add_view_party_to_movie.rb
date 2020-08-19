class AddViewPartyToMovie < ActiveRecord::Migration[5.2]
  def change
    add_reference :movies, :view_party, foreign_key: true
  end
end
