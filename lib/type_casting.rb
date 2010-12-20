module TypeCasting

 def value
   Convert(@value, data_item.data_type)
 end

end

module Kernel
  def Boolean(val, nil_value = nil)
    return nil_value if val.nil?
    return true if val == true || val == 1 || val == "1"
    return false if val == false || val == 0 || val =="0"
    val = val.to_s.downcase
    return true if val == "true"
    return false if val == "false" || val == "no"
    raise "invalid value for Boolean(): #{val}"
  end
  
  def Convert(val, data_type)
    case data_type
      when 'int' then Integer(val) rescue nil
      when 'float' then Float(val) rescue nil
      when 'bool' then Boolean(val) rescue nil
      else String(val)
    end
  end
  
end
