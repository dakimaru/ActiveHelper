class MembershipsController < ApplicationController
  before_filter :signed_in_user
  
  def create
    @organization = Organization.find(params[:membership][:organization_id])
    current_user.join!(@organization)
    respond_to do |format|
      format.html { redirect_to @organization }
      format.js
    end
  end

  def destroy
    @organization = Membership.find(params[:id]).organization
    current_user.leave!(@organization)
    respond_to do |format|
      format.html { redirect_to @organization }
      format.js
    end
  end
end