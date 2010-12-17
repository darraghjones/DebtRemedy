class CreateClients < ActiveRecord::Migration
  def self.up
    create_table :clients do |t|
      t.string :web_number
      t.date :last_login

      t.timestamps
    end
  end

  def self.down
    drop_table :clients
  end
end
