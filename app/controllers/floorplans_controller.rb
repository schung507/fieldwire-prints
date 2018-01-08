class FloorplansController < ApplicationController
	def create
	  @project = current_user.projects.find_by(id: params[:floorplan]["project_id"])
      @floorplan = @project.floorplans.build(floorplan_params)
      if @floorplan.save
      	byebug
        params[:versions]['blueprint'].each do |a|
          version_num = @floorplan.versions.count
          @version = @floorplan.versions.create!(:blueprint => a, :version_num => version_num + 1)
        end
        redirect_to root_url
      else
        render 'users/show'
      end
	end 

	private

	  def floorplan_params
	    params.require(:floorplan).permit(versions_attributes: [:blueprint])
	  end
end
