class FixFriendsRequestDataType < ActiveRecord::Migration[5.2]
  def change
    change_column :friends, :request_status, 'integer USING CAST(request_status AS integer)'
  end
end
