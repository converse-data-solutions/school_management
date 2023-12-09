class RemoveForeignKeyConstraintFromStudentHistories < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :student_histories, :students
  end
end
