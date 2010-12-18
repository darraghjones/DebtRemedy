class CreateClientDebts < ActiveRecord::Migration
  def self.up
    create_table :client_debts do |t|
      t.string :creditor
      t.string :type
      t.string :owner
      t.string :balance
      t.integer :client_id

      t.timestamps
    end
  end

  def self.down
    drop_table :client_debts
  end
end
