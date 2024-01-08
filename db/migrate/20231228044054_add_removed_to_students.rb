class AddRemovedToStudents < ActiveRecord::Migration[7.1]
  def change
    add_column :students, :removed, :boolean, default: false
  end
end
