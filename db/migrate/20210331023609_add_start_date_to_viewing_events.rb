class AddStartDateToViewingEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :viewing_events, :start_date, :date
  end
end
