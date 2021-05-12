class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.integer :runtime
      t.string :title
      t.float :avg_score

      t.timestamps
    end
  end
end
