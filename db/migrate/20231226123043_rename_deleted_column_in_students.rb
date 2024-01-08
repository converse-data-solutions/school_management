class RenameDeletedColumnInStudents < ActiveRecord::Migration[7.1]
  def change
    rename_column :students, :deleted, :status
  end
end
