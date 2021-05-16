class AddRuntimeToParties < ActiveRecord::Migration[5.2]
  def change
    add_column :parties, :runtime, :integer
  end
end
