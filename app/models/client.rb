require 'calculations'
require 'mixology'

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
  
  validates_presence_of [:debt_remedy_for, :num_adults, :partner_aware, :num_children, :where_in_uk, :maritial_status, :gender, :age_range, :housing_status, :num_vehicals, :num_hp, :any_pets, :lost_interest, :feeling_down, :feeling_nervous, :worrying ]
  validates_presence_of :rent_type, :if => lambda {|client| client.housing_status == "rent"}
    
  has_many :client_answers, :dependent => :destroy, :include => :data_item
  has_many :client_debts, :dependent => :destroy
  accepts_nested_attributes_for :client_debts, :allow_destroy => true, 
    #:reject_if => proc {|attributes| attributes.any? {|a| a.blank?}}
    #:reject_if => :debt_is_not_valid
    :reject_if => :mostly_blank

  def mostly_blank(attributes)
    attributes['creditor'].blank? && attributes['debt_type'].blank? && attributes['balance'].blank? && attributes['owner'].blank?
  end
  
  
  DataItem.all.each do |item|
  
    if item.data_type == 'int'
      validates_numericality_of "#{item.name}", :unless => lambda {|client| client.send("#{item.name}").blank?}
    end
    
    if item.name.match(/_arrears$/) 
      validates_presence_of "#{item.name}", :unless => lambda {|client| client.send("#{item.name.sub(/_arrears$/, '')}").blank?}
    end
  
    define_method item.name do
      #a = answers.find_by_question_id(q.id)
      a = client_answers.select {|a| a.data_item_id == item.id}[0]
      if a.nil? 
        item.default_value
      else
        a.value
      end
    end
    define_method "#{item.name}=" do |value|
      #a = answers.find_by_question_id(q.id) || answers.new({:question_id => q.id})
      a = client_answers.select {|a| a.data_item_id == item.id}[0] 
      if a.nil?
        a = client_answers.new(:data_item_id => item.id)
        a.value = value
        client_answers << a
      else 
        a.value = value
        a.save        
      end
    end
  end

end
