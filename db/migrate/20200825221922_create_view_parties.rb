class CreateViewParties < ActiveRecord::Migration[5.2]
  def change
    create_table :view_parties do |t|
      t.string :title
      t.string :date
      t.string :time
      t.integer :duration
      t.string :poster
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
