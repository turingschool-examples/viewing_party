class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.date :date
      t.datetime :time
      t.integer :runtime
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
