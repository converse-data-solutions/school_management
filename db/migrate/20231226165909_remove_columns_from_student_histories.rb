class RemoveColumnsFromStudentHistories < ActiveRecord::Migration[7.1]
  def change
    remove_column :student_histories, :father_name
    remove_column :student_histories, :mother_name
    remove_column :student_histories, :mobile_number
    remove_column :student_histories, :address
    remove_column :student_histories, :gender
    remove_column :student_histories, :date_of_birth
    remove_column :student_histories, :date_of_admission
    remove_column :student_histories, :section_id
    remove_column :student_histories, :user_id
  end
end
