class AddDeletedToStudents < ActiveRecord::Migration[7.1]
  def change
    add_column :students, :deleted, :string
  end
end
