class AddCreatedByToAttendances < ActiveRecord::Migration[7.1]
  def change
    add_column :attendances, :created_by, :bigint
  end
end
