class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.string :ProjectID
      t.string :UserName
      t.text :Tasks
      t.date :Deadline

      t.timestamps
    end
  end

  def self.down
    drop_table :tasks
  end
end
