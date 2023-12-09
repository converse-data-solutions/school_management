class AddSectionAndStandardToStudentHistories < ActiveRecord::Migration[7.1]
  def change
    add_column :student_histories, :section_name, :string
    add_column :student_histories, :standard_name, :string
  end
end
