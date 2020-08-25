class CreateViewParties < ActiveRecord::Migration[5.2]
  def change
    create_table :view_parties do |t|
      t.string :movie_title
      t.string :date
      t.string :time
      t.string :runtime
      t.timestamps
    end
  end
end
