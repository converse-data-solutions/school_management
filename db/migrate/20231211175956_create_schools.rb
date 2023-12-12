class CreateSchools < ActiveRecord::Migration[7.1]
  def change
    create_table :schools do |t|
      t.string :school_name
      t.string :school_address1
      t.string :school_address2
      t.string :school_email
      t.bigint :school_phone
      t.string :academic_year

      t.timestamps
    end
  end
end
