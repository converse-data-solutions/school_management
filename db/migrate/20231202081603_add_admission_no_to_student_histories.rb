class AddAdmissionNoToStudentHistories < ActiveRecord::Migration[7.1]
  def change
    add_column :student_histories, :admission_no, :integer
  end
end
