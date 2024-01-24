class AddRemovedToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :removed, :boolean, default: false
  end
end
