class FixFriendsRequestStatus < ActiveRecord::Migration[5.2]
  def change
    rename_column :friends, :request_status_integer, :request_status
  end
end
