class AddDateToParties < ActiveRecord::Migration[5.2]
  def change
    add_column :parties, :date, :datetime
  end
end
