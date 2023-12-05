class AddStudentIdToStudentHistories < ActiveRecord::Migration[7.1]
  def change
    add_reference :student_histories, :student, null: false, foreign_key: true
  end
end
