class AddRemovedToStandards < ActiveRecord::Migration[7.1]
  def change
    add_column :standards, :removed, :boolean, default: false
  end
end
