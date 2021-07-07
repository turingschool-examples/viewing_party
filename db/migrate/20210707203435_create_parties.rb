class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.bigint "host_id"
      t.integer "movie_id"
      t.string "title"
      t.integer "duration"
      t.date "date"
      t.time "start_time"

      t.timestamps
    end
  end
end
