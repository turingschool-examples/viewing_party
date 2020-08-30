class AddHostToViewParties < ActiveRecord::Migration[5.2]
  def change
    add_column :view_parties, :host, :string
  end
end
