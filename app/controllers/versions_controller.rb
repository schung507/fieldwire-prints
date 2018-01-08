class VersionsController < ApplicationController
	def create
		@floorplan = Floorplan.find(params[:version]["floorplan_id"])
		@version = @floorplan.versions.build(version_params)
		if @version.save

			@version.update(:version_num => @floorplan.versions.count)
			redirect_to root_url
		else
			render 'users/show'
		end
	end

	def destroy
      @version = Version.find_by(id: params[:id])
      @floorplan = Floorplan.find(@version.floorplan_id)
      if @version.present?
        @version.destroy
        if @floorplan.versions.count == 0
        	@floorplan.destroy
        end
      end
      redirect_to request.referrer || root_url
  	end

  	def update
  	   @version = Version.find_by(id: params[:id])
  	   @version.update(:version_num => params[:version]["version_num"])
  	   redirect_to request.referrer || root_url
  	end

	private 

	def version_params
	    params.require(:version).permit(:floorplan_id, :blueprint, :version_num, :message)
	  end
end
