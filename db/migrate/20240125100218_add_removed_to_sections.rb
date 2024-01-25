class AddRemovedToSections < ActiveRecord::Migration[7.1]
  def change
    add_column :sections, :removed, :boolean, default: false
  end
end
