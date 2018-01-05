class RemoveKeyFromFloorplans < ActiveRecord::Migration
  def change
    remove_column :projects, :floorplan_id
  end
end
