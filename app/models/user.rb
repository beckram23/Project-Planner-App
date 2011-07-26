require 'digest/sha1'

class User < ActiveRecord::Base
	belongs_to :project
	belongs_to :task
	validates :UserName, :presence => true, :length => 5..30, :uniqueness => true
	validates :Password, :presence => true, :length => 5..20
	validates :Type, :presence => true

	def self.encrypt(u,p)
		return Digest::SHA1.hexdigest(u+p)
	end

	def self.search(user,password)
		u = User.find(:first, :conditions => ["UserName = ? and Password = ?", user, password])
		return nil if u.nil?
		return u
	end
end

