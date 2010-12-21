class Feedback
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :content, :name, :email
  validates_presence_of :content
  

  def initialize(attributes = {})
    attributes ||= {}
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end


  def persisted?
    false
  end
  
end
