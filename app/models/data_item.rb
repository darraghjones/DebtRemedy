# == Schema Information
# Schema version: 20101219152706
#
# Table name: data_items
#
#  id            :integer         not null, primary key
#  name          :string(255)
#  default_value :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  data_type     :string(255)
#

class DataItem < ActiveRecord::Base
  validates_presence_of :name
  validates_inclusion_of :data_type, :in => ['int', 'float', 'bool', 'string']
  
  def default_value
    val = read_attribute :default_value
    @default_value = Convert(val, data_type)
  end

  def default_value=(val)    
    @default_value = Convert(val, data_type)
    write_attribute :default_value, @default_value.to_s
  end  
  
end
