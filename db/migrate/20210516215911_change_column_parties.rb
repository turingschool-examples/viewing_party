class ChangeColumnParties < ActiveRecord::Migration[5.2]
  def change
    add_reference :parties, :user, foreign_key: true
    remove_column :parties, :host_id
  end
end
