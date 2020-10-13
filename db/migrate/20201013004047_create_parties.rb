class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.string :title
      t.integer :api_id
      t.string :runtime
      t.datetime :datetime_of_party
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
