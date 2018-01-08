class AddFloorplanToVersions < ActiveRecord::Migration
  def change
  	add_reference :versions, :floorplan, index: true, foreign_key: true
  end
end
