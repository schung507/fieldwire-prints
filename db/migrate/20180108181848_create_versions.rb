class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.string :blueprint
      t.integer :version_num
      t.string :versions

      t.timestamps null: false
    end
  end
end
