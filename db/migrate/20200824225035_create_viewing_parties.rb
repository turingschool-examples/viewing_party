class CreateViewingParties < ActiveRecord::Migration[5.2]
  def change
    create_table :viewing_parties do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.integer :runtime
      t.string :poster
      t.string :date

      t.timestamps
    end
  end
end
