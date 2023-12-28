class AddColumnDeletedToStudents < ActiveRecord::Migration[7.1]
  def up
    # rename_table :student_histories, :academic_details
  end

  def down
    remove_column :students, :deleted
  end
end
