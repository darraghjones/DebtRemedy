class Emailer < ActionMailer::Base
  default :from => "from@example.com"

  def send_feedback
    mail(:to => "darragh.jones@gmail.com", :subject => "sub")
  end

end
