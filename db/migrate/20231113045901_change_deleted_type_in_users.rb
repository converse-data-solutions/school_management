class ChangeDeletedTypeInUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :deleted, :string
  end
end
