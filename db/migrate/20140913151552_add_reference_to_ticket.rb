class AddReferenceToTicket < ActiveRecord::Migration
  def change
    add_column :tickets, :reference_id, :string
    add_index :tickets, :reference_id
  end
end
