class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.references :movie, foreign_key: true
      t.references :user, foreign_key: true
      t.datetime :datetime
    end
  end
end
