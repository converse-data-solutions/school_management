class RenameStudentHistoriesToAcademicDetails < ActiveRecord::Migration[7.1]
  def change
    rename_table :student_histories, :academic_details
  end
end
