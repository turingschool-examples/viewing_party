class ChangeTimeToBeStringInParties < ActiveRecord::Migration[5.2]
  def change
    change_column :parties, :time, :time
  end
end
