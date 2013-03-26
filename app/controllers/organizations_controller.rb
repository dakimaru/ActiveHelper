class OrganizationsController < ApplicationController
  
    before_filter :signed_in_organization,  
                  only: [:index, :edit, :update, :destroy, :following, :followers]
    before_filter :correct_organization,    only: [:edit, :update]

    def index
      @users = User.paginate(page: params[:page])
      @organizations = Organization.paginate(page: params[:page])
      @projects = Project.paginate(page: params[:page])
    end

    def show
      @organization = Organization.find(params[:id])
    end

    def new
      @organization = Organization.new
    end

    def create
      @organization = Organization.new(params[:organization])
      if @organization.save
        #OrganizationMailer.signup_confirmation(@organization).deliver
        sign_in_org @organization
        flash[:success] = "Welcome! You have Signed up successfully."
        redirect_to @organization
        #redirect_to @organization, notice: "Welcome! You have Signed up successfully."

      else
        render 'new'
      end    
    end

    def edit
    end

    def update
      if @organization.update_attributes(params[:organization])
        flash[:success] = "Profile updated"
        sign_in_org @organization
        redirect_to @organization
      else
        render 'edit'
      end
    end

    def destroy
      Organization.find(params[:id]).destroy
      flash[:success] = "Organization destroyed."
      redirect_to organizations_path
    end

    def following
      @title = "Following"
      @organization = Organization.find(params[:id])
      @organizations = @organization.followed_organizations.paginate(page: params[:page])
      render 'show_follow'
    end

    def followers
      @title = "Followers"
      @organization = Organization.find(params[:id])
      @organizations = @organization.followers.paginate(page: params[:page])
      render 'show_follow'
    end
    
    private

      def correct_organization
        @organization = Organization.find(params[:id])
        redirect_to root_path unless current_organization?(@organization)
      end

    

  end
