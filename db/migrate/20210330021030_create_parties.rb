class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.references :user, foreign_key: true
      t.string :movie_id
      t.time :time
      t.date :date

      t.timestamps
    end
  end
end
