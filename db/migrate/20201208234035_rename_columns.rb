class RenameColumns < ActiveRecord::Migration[5.2]
  def change
    rename_column :viewings, :duration, :duration_of_party
    rename_column :movies, :duration, :duration_of_movie
  end
end
