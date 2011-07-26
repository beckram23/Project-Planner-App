class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :UserName
      t.string :Password
      t.string :Type

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
