class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.references :user, foreign_key: true

      t.timestamps null: false
    end
    add_index :projects, [:user_id, :created_at]
  end
end
