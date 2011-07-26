class Project < ActiveRecord::Base
	has_many :user
	has_many :task
	validates :ProjectID, :presence => true, :uniqueness => true
	validates :Title, :presence => true, :uniqueness => true
	validates :Status, :presence => true
end
