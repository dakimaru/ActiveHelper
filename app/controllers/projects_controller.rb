class ProjectsController < ApplicationController

  before_filter :signed_in_organization,  
                only: [:index, :edit, :update, :destroy, :following, :followers]
  before_filter :owning_organization,    only: [:edit, :update]
  
  def index
    @projects = Project.paginate(page: params[:page])
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = current_organization.projects.build(params[:project])
    if @project.save
      flash[:success] = "Great! A new project has been created."
      redirect_to @project
    else
      render 'new'
    end    
  end

  def edit
  end

  def update
    if @project.update_attributes(params[:project])
      flash[:success] = "Information updated"
      redirect_to @project
    else
      render 'edit'
    end
  end

  

  def destroy
    Project.find(params[:id]).destroy
    flash[:success] = "Project destroyed."
    redirect_to organization_path

  end

end
  
