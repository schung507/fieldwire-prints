class AddBlueprintToFloorplan < ActiveRecord::Migration
  def change
    add_column :floorplans, :blueprint, :string
  end
end
