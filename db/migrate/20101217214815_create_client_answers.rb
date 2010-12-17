class CreateClientAnswers < ActiveRecord::Migration
  def self.up
    create_table :client_answers do |t|
      t.string :value
      t.integer :client_id
      t.integer :data_item_id

      t.timestamps
    end
  end

  def self.down
    drop_table :client_answers
  end
end
