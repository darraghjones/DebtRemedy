# == Schema Information
# Schema version: 20101217214815
#
# Table name: data_items
#
#  id            :integer         not null, primary key
#  name          :string(255)
#  default_value :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

class DataItem < ActiveRecord::Base
  validates_presence_of :name
end
