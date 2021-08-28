class ChangeDataTypeForDuration < ActiveRecord::Migration[5.2]
  def change
    remove_column :watch_parties, :duration
    add_column :watch_parties, :duration, :integer
  end
end
