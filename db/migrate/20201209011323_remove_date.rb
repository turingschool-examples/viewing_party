class RemoveDate < ActiveRecord::Migration[5.2]
  def change
    remove_column :viewings, :date
  end
end
