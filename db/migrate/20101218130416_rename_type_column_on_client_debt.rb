class RenameTypeColumnOnClientDebt < ActiveRecord::Migration
  def self.up
    rename_column :client_debts, :type, :debt_type
  end

  def self.down
    rename_column :client_debts, :debt_type, :type
  end
end
