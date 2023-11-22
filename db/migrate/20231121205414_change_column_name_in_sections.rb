class ChangeColumnNameInSections < ActiveRecord::Migration[7.1]
  def change
    rename_column :sections, :name, :section_name

  end
end
