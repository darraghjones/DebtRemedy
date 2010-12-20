class AddDataTypeToDataItems < ActiveRecord::Migration
  def self.up
    add_column :data_items, :data_type, :string
  end

  def self.down
    remove_column :data_items, :data_type
  end
end
