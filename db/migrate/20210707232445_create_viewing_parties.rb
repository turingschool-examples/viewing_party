class CreateViewingParties < ActiveRecord::Migration[5.2]
  def change
    create_table :viewing_parties do |t|
      t.references :user, foreign_key: true
      t.string :movie_title
      t.date :date
      t.time :duration
      t.time :start_time
      t.timestamps
    end
  end
end
