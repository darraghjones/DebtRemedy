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
    @partner_aware = @client.partner_aware ? "true" : "false"
  end

  def about_you_submit
    if @client.update_attributes(params[:client])
      return redirect_to :action => :logout if params[:commit] == "Save & exit"
      redirect_to :action => :your_income
    else
      render :action => :about_you
    end
  end


  def your_income
  end
  
  def your_income_submit
    if @client.update_attributes(params[:client])
      return redirect_to :action => :logout if params[:commit] == "Save & exit"
      redirect_to :action => :priority
    else
      render :action => :your_income
    end
  end


  def priority
  end

  def priority_submit    
    if @client.update_attributes(params[:client])
      return redirect_to :action => :logout if params[:commit] == "Save & exit"
      redirect_to :action => :other_expenses
    else
      render :action => :priority
    end
  end



  def other_expenses
  end

  def other_expenses_submit
    if @client.update_attributes(params[:client])
      return redirect_to :action => :logout if params[:commit] == "Save & exit"
      redirect_to :action => :living_expenses
    else
      render :action => :other_expenses
    end
  end

  def living_expenses
  end

  def living_expenses_submit
    if @client.update_attributes(params[:client])
      return redirect_to :action => :logout if params[:commit] == "Save & exit"
      redirect_to :action => :assets
    else
      render :action => :living_expenses
    end
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
    
    if @client.update_attributes(params[:client])
      return redirect_to :action => :logout if params[:commit] == "Save & exit"
      redirect_to :action => :who_you_owe
    else
      render :action => :assets
    end
  end

  def who_you_owe
    (6 - @client.client_debts.count).times {@client.client_debts.build}
  end

  def who_you_owe_submit
    if @client.update_attributes(params[:client])
      return redirect_to :action => :logout if params[:commit] == "Save & exit"
      redirect_to :action => :last_not_least
    else
      #(6 - @client.client_debts.count).times {@client.client_debts.build}
      render :action => :who_you_owe
    end
  end

  def last_not_least
    logger.debug @client.institute_of_chartered_accountants_in_england_and_wales ? "yes" : "no"
  end

  def last_not_least_submit
    if @client.update_attributes(params[:client])
      return redirect_to :action => :logout if params[:commit] == "Save & exit"
      redirect_to :action => :please_wait
    else
      render :action => :last_not_least
    end
  end

  def please_wait
    redirect_to :action => :recommendation
  end

  def recommendation
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
