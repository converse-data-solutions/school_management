class AddRemovedToAcademicDetails < ActiveRecord::Migration[7.1]
  def change
    add_column :academic_details, :removed, :boolean, default: false
  end
end
