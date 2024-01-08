class CreateAcademicFees < ActiveRecord::Migration[7.1]
  def change
    create_table :academic_fees do |t|
      t.decimal :discount
      t.decimal :actual_fee
      t.decimal :payable_fee
      t.references :academic_detail, null: false, foreign_key: true

      t.timestamps
    end
  end
end
