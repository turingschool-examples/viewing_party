class AddAttendingToUserViewParties < ActiveRecord::Migration[5.2]
  def change
    add_column :user_view_parties, :attending, :boolean, default: false
  end
end
