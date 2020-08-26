class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.string :title
      t.string :party_date
      t.string :party_time
      t.string :attendees
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
