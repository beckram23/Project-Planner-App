class Task < ActiveRecord::Base
	has_many :user
	has_many :project
	validates :ProjectID, :presence => true
	validates :UserName, :presence => true, :length => 5..30
	validates :Tasks, :presence => true
	validates :Deadline, :presence => true
	validates :Status, :presence => true
end
