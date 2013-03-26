class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    user = User.find_by_email(params[:email])
    if user.nil?
      organization = Organization.find_by_email(params[:email])
      if organization && organization.authenticate(params[:password])
        if params[:remember_me]
          cookies.permanent[:remember_token_org] = organization.remember_token_org
        else
          cookies[:remember_token_org] = organization.remember_token_org
        end
        redirect_back_or organization
      else
        flash.now.alert = 'Invalid email/password combination'
        render 'new'
      end
        
    else
      if user && user.authenticate(params[:password])
        if params[:remember_me]
          cookies.permanent[:remember_token] = user.remember_token
        else
          cookies[:remember_token] = user.remember_token
        end
        redirect_back_or user 
      else
        flash.now.alert = 'Invalid email/password combination'
        render 'new'
      end
      
    end
    
  end
  
  def destroy
    sign_out
    redirect_to root_path, :notice => "Logged out!"
  end
  
end
