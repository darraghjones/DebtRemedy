class CreateDataItems < ActiveRecord::Migration
  def self.up
    create_table :data_items do |t|
      t.string :name
      t.string :default_value

      t.timestamps
    end
  end

  def self.down
    drop_table :data_items
  end
end
