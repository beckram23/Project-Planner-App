class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :ProjectID
      t.string :Title
      t.string :Status

      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
