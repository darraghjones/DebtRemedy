class SessionController < ApplicationController

  before_filter :except => [:new, :create, :qaq, :qaq_submit, :web_number] do
    @client = current_client
  end

  def new
  end

  def create
  end

  def update
  end

  def qaq
  end

  def qaq_submit
    redirect_to :action => :about_you
  end

  def web_number
    #@client.web_number = "W" + rand(10000).to_s
    #current_client = @client
  end

  def about_you
  end

  def about_you_submit
    if @client.update_attributes(params[:client])
      redirect_to :action => :your_income
    else
      render :action => :about_you
    end
  end


  def your_income
  end
  
  def your_income_submit
    if @client.update_attributes(params[:client])
      if params[:commit] == "Next"
        redirect_to :action => :priority
      else
        redirect_to :action => :logout
      end
    else
      render :action => :your_income
    end
  end


  def priority
  end

   def priority_submit
    if @client.update_attributes(params[:client])
      redirect_to :action => :other_expenses
    else
      render :action => :priority
    end
  end



  def other_expenses
  end

    def other_expenses_submit
    if @client.update_attributes(params[:client])
      redirect_to :action => :living_expenses
    else
      render :action => :other_expenses
    end
  end

  def living_expenses
  end

  def living_expenses_submit
    if @client.update_attributes(params[:client])
      redirect_to :action => :assets
    else
      render :action => :living_expenses
    end
  end

  def assets
  end

  def assets_submit
    if @client.update_attributes(params[:client])
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
      redirect_to :action => :last_not_least
    else
      render :action => :who_you_owe
    end
  end

  def last_not_least
  end

  def last_not_least_submit
    if @client.update_attributes(params[:client])
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
        pdf = Prawn::Document.new
        pdf.text("Prawn Rocks")
        send_data pdf.render, :filename => 'remedy.pdf', :type => 'application/pdf', :disposition => 'inline'
      end
    end
  end

  def email_booklet
    Emailer.send_feedback.deliver 
  end

  def your_details
  end

  def logout
  end

  def closure
  end

end
