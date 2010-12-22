class AddContractualPaymentToClientDebt < ActiveRecord::Migration
  def self.up
    add_column :client_debts, :contractual_payment, :int
  end

  def self.down
    remove_column :client_debts, :contractual_payment
  end
end
