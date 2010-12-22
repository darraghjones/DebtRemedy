class SessionController < ApplicationController

  before_filter :except => [:new, :create, :qaq, :qaq_submit, :web_number] do
    @client = current_client
    if @client.nil? 
      redirect_to :action => :new
      return false
    end    
    @sql = StringIO.new(flash[:sql] || '')
    ActiveRecord::Base.logger = Logger.new(@sql)     
  end
  
   
  after_filter do
    flash[:sql] = @sql.string if @sql && response.status == 302    
  end
  
 
  def back_exit_next(current)
    navigation = [:about_you, :your_income, :priority, :other_expenses, :living_expenses, :assets, :who_you_owe, :last_not_least, :recommendation]
    current_index = navigation.index(current)
    case params[:commit]
      when "Back"
        if @client.update_attributes(params[:client])
          return redirect_to :action => navigation[current_index - 1]
        end
      when "Next"
        if @client.update_attributes(params[:client])
          return redirect_to :action => navigation[current_index + 1]
        end
      when "Save & exit"
        @client.attributes = params[:client]
        @client.save(false)
        return redirect_to :action => :logout
    end
    render :action => current
  end
  
  def new
  end

  def create
    @client = Client.find_by_web_number(params[:web_number])
    if @client
      self.current_client = @client
      redirect_to :action => :welcome_back
    else
      redirect_to :action => :new, :notice => "Invalid"
    end
  end

  def welcome_back
  end


  def qaq
    @qaq = QuickAssessmentQuestions.new
  end

  def qaq_submit
    @qaq = QuickAssessmentQuestions.new(params[:quick_assessment_questions])
    if @qaq.valid?
      #if @qaq.q_8 == "true" then return redirect_to :action => :self_employed end
      redirect_to :action => :web_number
    else
      render :action => :qaq
    end
  end

  def self_employed
  end

  def web_number
    @client = Client.new
    @client.web_number = "W" + rand(10000).to_s
    @client.save(false)
    self.current_client = @client
  end

  def about_you
  end

  def about_you_submit
   back_exit_next(:about_you)
  end


  def your_income
  end
  
  def your_income_submit
    back_exit_next(:your_income)
  end


  def priority
  end

  def priority_submit    
    back_exit_next(:priority)
  end



  def other_expenses
  end

  def other_expenses_submit
    back_exit_next(:other_expenses)
  end

  def living_expenses
  end

  def living_expenses_submit
    back_exit_next(:living_expenses)
  end

  def assets
  end

  def assets_submit
    class << @client
      validates_presence_of [:property_owner, :property_value, :property_outstanding], :if => lambda {|client| ['mortgage','own'].include? client.housing_status } 
      validates_presence_of [:any_other_property]
      validates_presence_of [:other_property_owner, :other_property_value, :other_property_outstanding], :if => lambda {|client| client.any_other_property == 'true' }
      validates_presence_of :total_savings_owner, :unless => lambda {|client| client.total_savings.blank?}
      validates_presence_of :other_valuables_owner, :unless => lambda {|client| client.other_valuables.blank?}
    end
    
    back_exit_next(:assets)
  end

  def who_you_owe
    (6 - @client.client_debts.count).times {@client.client_debts.build}
  end

  def who_you_owe_submit
    back_exit_next(:who_you_owe)
  end

  def last_not_least
  end

  def last_not_least_submit
    back_exit_next(:last_not_least)
  end

  def please_wait
    redirect_to :action => :recommendation
  end

  def recommendation
    @client.extend Calculations
  end

  def remedy
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => "remedy.pdf", :stylesheets => ["application", "prince"], :layout => "pdf"
      end
    end
  end

  def email_booklet
  end

  def send_feedback
    @feedback = Feedback.new(params[:feedback])
    if @feedback.valid?      
      Emailer.send_feedback(@feedback).deliver
      render :text => "Thank you for your feedback"
    else
      render :action => :logout
    end
  end

  def your_details
  end

  def logout
    @feedback = Feedback.new
  end

  def closure
  end

end
