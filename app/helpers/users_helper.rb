module UsersHelper
  
  def sign_in(user)
    if params[:remember_me]
      cookies.permanent[:remember_token] = user.remember_token
    else
      cookies[:remember_token] = user.remember_token
    end
    self.current_user = user
  end
  
  def signed_in_user?
    !current_user.nil?
  end
  
  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by_remember_token!(cookies[:remember_token]) if cookies[:remember_token]
  end

  def current_user?(user)
    user == current_user
  end
  
  def signed_in_user
    unless signed_in_user?
      store_location
      redirect_to signin_path, notice: "Please sign in."
    end
  end
  
end
