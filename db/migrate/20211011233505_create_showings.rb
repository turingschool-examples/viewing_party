class CreateShowings < ActiveRecord::Migration[5.2]
  def change
    create_table :showings do |t|
      t.string :movie_title
      t.integer :duration
      t.string :day
      t.string :start_time
    end
  end
end
