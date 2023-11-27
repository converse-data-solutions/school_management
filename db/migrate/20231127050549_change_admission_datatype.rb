class ChangeAdmissionDatatype < ActiveRecord::Migration[7.1]
  def change
    change_column :students, :admission_no, :integer
  end
end
