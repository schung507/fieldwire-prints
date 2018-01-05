class AddProjectToFloorplans < ActiveRecord::Migration
  def change
    add_reference :floorplans, :project, index: true, foreign_key: true
  end
end
