class EditColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :viewing_parties, :runtime, :duration
  end
end
