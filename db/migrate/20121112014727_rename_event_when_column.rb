class RenameEventWhenColumn < ActiveRecord::Migration
  def change
    rename_column :events, :when, :start_time
  end
end
