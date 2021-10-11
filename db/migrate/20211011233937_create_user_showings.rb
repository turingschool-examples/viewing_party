class CreateUserShowings < ActiveRecord::Migration[5.2]
  def change
    create_table :user_showings do |t|
      t.references :user, foreign_key: true
      t.references :showing, foreign_key: true
      t.boolean :user_hosting

      t.timestamps
    end
  end
end
