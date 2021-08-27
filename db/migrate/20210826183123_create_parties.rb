class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.references :user, foreign_key: true
      t.timestamp :time
      t.integer :movie

      t.timestamps
    end
  end
end
