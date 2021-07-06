class CreateViewingParty < ActiveRecord::Migration[5.2]
  def change
    create_table :viewing_parties do |t|
      t.references :user, foreign_key: true
      t.string :movie_title
      t.datetime :date_time

      t.timestamps
    end
  end
end
