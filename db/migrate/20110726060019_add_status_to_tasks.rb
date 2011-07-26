class AddStatusToTasks < ActiveRecord::Migration
  def self.up
    add_column :tasks, :Status, :string
  end

  def self.down
    remove_column :tasks, :Status
  end
end
