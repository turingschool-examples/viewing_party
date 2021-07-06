class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.integer :host_id
      t.integer :movie_id
      t.datetime :start
      t.datetime :end
      t.string :movie_title
    end
  end
end
