class FloorplansController < ApplicationController
    def new
      @project = Project.find(params[:project_id])
      @floorplan = Floorplan.new
    end
    
    def create
      @floorplan = Floorplan.new(floorplan_params)
      if @floorplan.save
        redirect_to root_url
      else
        render 'users/show'
      end
    end
    
    def show
    end
  
    
    private

    def floorplan_params
      params.require(:floorplan).permit(:blueprint, :versions, :project_id)
    end
end
