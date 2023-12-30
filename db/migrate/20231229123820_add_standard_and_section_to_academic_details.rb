class AddStandardAndSectionToAcademicDetails < ActiveRecord::Migration[7.1]
  def change
    add_column :academic_details, :standard_id, :bigint
    add_column :academic_details, :section_id, :bigint
  end
end