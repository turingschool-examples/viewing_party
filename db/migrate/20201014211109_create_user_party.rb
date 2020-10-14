class CreateUserParty < ActiveRecord::Migration[5.2]
  def change
    create_table :user_parties do |t|
      t.references :attendee, foreign_key: {to_table: :users}
      t.references :party, foreign_key: true
      t.boolean :is_host, default: false

      t.timestamps
    end
  end
end
