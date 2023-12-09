class CreateNotices < ActiveRecord::Migration[7.1]
  def change
    create_table :notices do |t|
      t.string :notice_type
      t.string :notice
      t.date :notice_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
