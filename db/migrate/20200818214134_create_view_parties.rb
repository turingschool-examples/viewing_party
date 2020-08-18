class CreateViewParties < ActiveRecord::Migration[5.2]
  def change
    create_table :view_parties do |t|
      t.integer :duration
      t.date :date

      t.timestamps
    end
  end
end
