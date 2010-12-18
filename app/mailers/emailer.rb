class Emailer < ActionMailer::Base
  default :from => "from@example.com"

  def send_feedback(feedback)
    @feedback = feedback
    mail(:to => "darragh.jones@gmail.com", :subject => "Feedback")
  end

end
