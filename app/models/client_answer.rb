require 'type_casting'

# == Schema Information
# Schema version: 20101217214815
#
# Table name: client_answers
#
#  id           :integer         not null, primary key
#  value        :string(255)
#  client_id    :integer
#  data_item_id :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class ClientAnswer < ActiveRecord::Base
  #include TypeCasting
  
  belongs_to :client
  belongs_to :data_item

=begin
  def value
    return nil if data_item.nil?
    val = read_attribute :value
    @value = Convert(val, data_item.data_type)
  end


  def value=(val)
    return if data_item.nil?
    logger.debug "start setting #{data_item.name} to #{val} (current type #{val.class})"
    @value = val
    write_attribute :value, Convert(@value, data_item.data_type)
    logger.debug "end setting #{data_item.name} to #{@value} (current type #{@value.class})"
    @value
  end  
  
  def to_s
    read_attribute :value
  end
=end
  
end



