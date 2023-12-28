class CreatePayments < ActiveRecord::Migration[7.1]
  def change
    create_table :payments do |t|
      t.string :payment_info
      t.datetime :paid_at
      t.string :mode_of_pay
      t.string :paid_by
      t.decimal :paid_amount
      t.references :academic_fee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
