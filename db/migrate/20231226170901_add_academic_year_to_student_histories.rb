class AddAcademicYearToStudentHistories < ActiveRecord::Migration[7.1]
  def change
    add_column :student_histories, :academic_year, :string
  end
end
