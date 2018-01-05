class RemoveFloorplansFromProject < ActiveRecord::Migration
  def change
    remove_column :projects, :floorplans
  end
end
