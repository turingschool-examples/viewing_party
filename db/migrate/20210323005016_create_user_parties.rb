class CreateUserParties < ActiveRecord::Migration[5.2]
  def change
    create_table :user_parties do |t|
      t.references :users, foreign_key: true
      t.references :parties, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
