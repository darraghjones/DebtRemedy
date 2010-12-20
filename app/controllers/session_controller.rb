class SessionController < ApplicationController

  before_filter :except => [:new, :create, :qaq, :qaq_submit] do
    @client = current_client
  end

  def new
  end

  def create
    @client = Client.find_by_web_number(params[:web_number])
    if @client
      current_client = @client
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
      if @qaq.q_8 then return redirect_to :action => :self_employed end
      redirect_to :action => :web_number
    else
      render :action => :qaq
    end
  end

  def self_employed
  end

  def web_number
    @client.web_number = "W" + rand(10000).to_s
  end

  def about_you
    @partner_aware = @client.partner_aware ? "true" : "false"
  end

  def about_you_submit
    class << @client
      validates_presence_of [:debt_remedy_for, :num_adults, :num_children, :where_in_uk, :maritial_status, :gender]
      #validates_inclusion_of :partner_aware, :in => [true, false]
    end
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
    class << @client
      validates_numericality_of [:take_home_pay], :unless => lambda { |client| client.take_home_pay.nil?}
    end
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
    class << @client
      validates_presence_of :mortgage_arrears, :if => Proc.new {|client| !client.mortgage.blank?}
    end
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
    feedback = Feedback.new
    feedback.content = params[:content]
    feedback.name = params[:name]
    logger.debug feedback.to_yaml
    Emailer.send_feedback(feedback).deliver
    render :text => "Thank you for your feedback"
  end

  def your_details
  end

  def logout
  end

  def closure
  end

end
