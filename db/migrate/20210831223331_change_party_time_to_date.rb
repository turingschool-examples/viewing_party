class ChangePartyTimeToDate < ActiveRecord::Migration[5.2]
  def change
    change_column :parties, :time, :time
    add_column :parties, :date, :date
  end
end
