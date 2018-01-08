class ProjectsController < ApplicationController

  def create
      @project = current_user.projects.build(project_params)
      @floorplan = @project.floorplans.build
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
      @floorpan = Floorplan.new
      @version = Version.new
  end
  
  private

  def project_params
    params.require(:project).permit(:name)
  end

end
