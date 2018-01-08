class RemoveColumnsfromFloorplan < ActiveRecord::Migration
  def change
  	remove_column :floorplans, :blueprint
  	remove_column :floorplans, :versions
  end
end
