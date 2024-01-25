class RenameDeletedColumnToStatusInUsers < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :deleted, :status
    change_column_default :users, :status, from: nil, to: "Active"
  end
end
