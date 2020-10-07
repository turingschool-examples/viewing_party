class CreateViewingParties < ActiveRecord::Migration[5.2]
  def change
    create_table :viewing_parties do |t|
      t.string :movie_title
      t.references :user, foreign_key: true
      t.string :date
      t.string :time

      t.timestamps
    end
  end
end
