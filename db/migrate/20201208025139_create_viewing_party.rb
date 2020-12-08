class CreateViewingParty < ActiveRecord::Migration[5.2]
  def change
    create_table :viewing_parties do |t|
      t.references :user, foreign_key: true
      t.integer :duration
      t.date :day
      t.time :start_time
    end
  end
end
