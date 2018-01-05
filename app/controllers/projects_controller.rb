class ProjectsController < ApplicationController
    def new
      @project = Project.find(params[:id])
      @floorplan = Floorplan.new
    end
    def create
        @project = current_user.projects.build(project_params)
         @floorplan = Floorplan.new
        if @project.save
          redirect_to root_url
        else
          render 'users/show'
        end
    end

    def destroy
        @project = current_user.projects.find_by(id: params[:id])
        if @project.present?
          @project.destroy
        end
        redirect_to request.referrer || root_url
    end
  
    def show
        @user = User.find_by_id(params[:id])
        @projects = @user.projects
    end
  
  private

  def project_params
    params.require(:project).permit(:name)
  end

end
