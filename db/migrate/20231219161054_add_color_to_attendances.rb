class AddColorToAttendances < ActiveRecord::Migration[7.1]
  def change
    add_column :attendances, :color, :string
  end
end
