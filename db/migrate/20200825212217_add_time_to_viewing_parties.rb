class AddTimeToViewingParties < ActiveRecord::Migration[5.2]
  def change
    add_column :viewing_parties, :time, :string
  end
end
