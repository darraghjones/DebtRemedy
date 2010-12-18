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
  belongs_to :client
  belongs_to :data_item
end
