require 'type_casting'

module Calculations
  extend TypeCasting
  
  def self.extended(base)
    # Initialize module.
    puts base.class
    base.client_answers.each {|a| a.value = Convert(a.value, a.data_item.data_type)}
  end
  
  def best_advice
    "DMP"
  end
  
  def total_take_home_pay
    take_home_pay + partner_take_home_pay
  end
  
  def save
    raise "cannot save client after extending with calculations"
  end

end
