class ChangePartiesColumName < ActiveRecord::Migration[5.2]
  def change
    rename_column :parties, :viewing_party_duration, :party_duration
    rename_column :parties, :viewing_party_date, :party_date
  end
end
