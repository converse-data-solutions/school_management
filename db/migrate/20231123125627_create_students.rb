class CreateStudents < ActiveRecord::Migration[7.1]
  def change
    create_table :students do |t|
      t.string :admission_no
      t.string :roll_no
      t.string :name
      t.string :father_name
      t.string :mother_name
      t.bigint :mobile_number
      t.string :address
      t.date :date_of_birth
      t.string :gender
      t.date :date_of_admission
      t.references :section, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
