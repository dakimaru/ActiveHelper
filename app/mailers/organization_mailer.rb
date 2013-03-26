class OrganizationMailer < ActionMailer::Base
  default from: "team@irenia.com"

  def signup_confirmation(organization)
    @organization = organization

    mail to: organization.email, subject: "Sign Up Confirmation"
  end
  
  def password_reset(organization)
    @organization = organization
    mail :to => organization.email, :subject => "Password Reset"
  end
 
end
