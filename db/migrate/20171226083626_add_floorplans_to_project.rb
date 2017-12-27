class AddFloorplansToProject < ActiveRecord::Migration
  def change
    add_column :projects, :floorplans, :string
  end
end
