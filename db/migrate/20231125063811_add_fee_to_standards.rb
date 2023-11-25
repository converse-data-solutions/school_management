class AddFeeToStandards < ActiveRecord::Migration[7.1]
  def change
    add_column :standards, :fee, :integer
  end
end
