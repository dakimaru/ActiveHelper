module ProjectsHelper
  
  def current_project=(project)
     @current_project = project
   end
   
   def project_owner
      @project.organization == current_organization
    end
    
    def owning_organization
      @organization = Project.find(params[:id]).organization
      @project = Project.find(params[:id])
      redirect_to root_path unless current_organization?(@organization)
    end
   
end
