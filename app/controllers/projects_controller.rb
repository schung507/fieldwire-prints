class ProjectsController < ApplicationController

  def create
      @project = current_user.projects.build(project_params)
      
      if @project.save
        params[:floorplans]['blueprint'].each do |a|
          @floorplan = @project.floorplans.create!(:blueprint => a, :project_id => @project.id)
        end
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
    params.require(:project).permit(:name, floorplans_attributes: [:id, :project_id, :blueprint])
  end

end
