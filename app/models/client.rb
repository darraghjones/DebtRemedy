require 'calculations'

# == Schema Information
# Schema version: 20101217214815
#
# Table name: clients
#
#  id         :integer         not null, primary key
#  web_number :string(255)
#  last_login :date
#  created_at :datetime
#  updated_at :datetime
#

class Client < ActiveRecord::Base
  include Calculations
  has_many :client_answers
  has_many :client_debts
  accepts_nested_attributes_for :client_debts, :reject_if => proc { |attributes| attributes['balance'].blank? }
  
  DataItem.all.each do |item|
    define_method item.name do
      #a = answers.find_by_question_id(q.id)
      a = client_answers.select {|a| a.data_item_id == item.id}[0]
      a && a.value || item.default_value
    end
    define_method "#{item.name}=" do |value|
      #a = answers.find_by_question_id(q.id) || answers.new({:question_id => q.id})
      a = client_answers.select {|a| a.data_item_id == item.id}[0] 
      if a
        a.value = value
        a.save
      else
        client_answers << client_answers.new(:data_item_id => item.id, :value  => value)
      end
    end
  end

end
