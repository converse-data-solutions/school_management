class ChangeMobileNumberDataType < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :mobile_number, :bigint
  end
end
