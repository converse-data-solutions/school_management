class CreateStudentHistories < ActiveRecord::Migration[7.1]
  def change
    create_table :student_histories do |t|
      t.integer :roll_no
      t.string :name
      t.string :father_name
      t.string :mother_name
      t.bigint :mobile_number
      t.string :address
      t.string :gender
      t.date :date_of_birth
      t.date :date_of_admission
      t.bigint :section_id
      t.bigint :user_id

      t.timestamps
    end
  end
end
