class AddUserToViewParties < ActiveRecord::Migration[5.2]
  def change
    add_reference :view_parties, :host
  end
end
