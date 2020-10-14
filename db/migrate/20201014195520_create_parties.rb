class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.string :title
      t.integer :duration
      t.string :date
      t.string :time

      t.timestamps
    end
  end
end
