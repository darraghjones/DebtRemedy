# == Schema Information
# Schema version: 20101219152706
#
# Table name: client_debts
#
#  id         :integer         not null, primary key
#  creditor   :string(255)
#  debt_type  :string(255)
#  owner      :string(255)
#  balance    :string(255)
#  client_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class ClientDebt < ActiveRecord::Base
  belongs_to :client
  validates_presence_of [:creditor, :debt_type, :owner, :balance]
  validates_numericality_of [:balance]

end
