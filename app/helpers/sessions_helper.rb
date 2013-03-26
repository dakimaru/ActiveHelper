module SessionsHelper

  def sign_out
    current_user = nil
    current_organization = nil
    cookies.delete(:remember_token)
    cookies.delete(:remember_token_org)
  end
  
  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end
  
  def store_location
    session[:return_to] = request.fullpath
  end

end