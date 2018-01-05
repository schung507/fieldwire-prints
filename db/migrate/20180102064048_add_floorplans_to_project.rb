class AddFloorplansToProject < ActiveRecord::Migration
  def change
    add_reference :projects, :floorplan, index: true, foreign_key: true
  end
end
