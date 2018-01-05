class AddVersionstoFloorplan < ActiveRecord::Migration
  def change
    add_column :floorplans, :versions, :string
  end
end
