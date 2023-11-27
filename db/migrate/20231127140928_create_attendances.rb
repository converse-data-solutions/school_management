class CreateAttendances < ActiveRecord::Migration[7.1]
  def change
    create_table :attendances do |t|
      t.date :date
      t.integer :status
      t.references :attendable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
