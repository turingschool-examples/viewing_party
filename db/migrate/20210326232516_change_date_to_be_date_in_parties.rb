class ChangeDateToBeDateInParties < ActiveRecord::Migration[5.2]
  def change
    change_column :parties, :date, :date
  end
end
