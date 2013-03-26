class NotificationsMailer < ActionMailer::Base
  
  default from: "team@irenia.com"
  default :to => "akimaru.dimitri@gmail.com"

  def new_message(message)
    @message = message
    mail(:subject => "Irenia | #{message.subject}")
  end
  
end
