class AddSingletonGuardToSchools < ActiveRecord::Migration[7.1]
  def change
    add_column :schools, :singleton_guard, :boolean
  end
end
