class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :name
    end

    add_column :tickets, :department_id, :integer
    add_index :tickets, :department_id
  end
end
