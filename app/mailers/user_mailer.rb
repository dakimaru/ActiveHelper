class UserMailer < ActionMailer::Base
  default from: "team@irenia.com"

  def signup_confirmation(user)
    @user = user

    mail to: user.email, subject: "Sign Up Confirmation"
  end
  
  def password_reset(user)
    @user = user
    mail :to => user.email, :subject => "Password Reset"
  end
  
end
