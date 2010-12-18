class QuickAssessmentQuestions
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  (1..10).each do |i|
    validates_presence_of "q_#{i}"
    attr_accessor "q_#{i}"
  end

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end


  def persisted?
    false
  end

end
