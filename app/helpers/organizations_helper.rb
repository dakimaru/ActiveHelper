module OrganizationsHelper
  
  def sign_in_org(organization)
    if params[:remember_me]
      cookies.permanent[:remember_token_org] = organization.remember_token
    else
      cookies[:remember_token_org] = organization.remember_token_org
    end
    self.current_organization = organization
  end
  
  def signed_in_organization?
    !current_organization.nil?
  end
  
  def current_organization=(organization)
    @current_organization = organization
  end

  def current_organization
    @current_organization ||= Organization.find_by_remember_token_org!(cookies[:remember_token_org]) if cookies[:remember_token_org]
  end
  
  
  def current_organization?(organization)
    organization == current_organization
  end
  
  def signed_in_organization
    unless signed_in_organization?
      store_location
      redirect_to signin_path, notice: "Please sign in."
    end
  end
  
end
