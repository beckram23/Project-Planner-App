class ApplicationController < ActionController::Base
	protect_from_forgery
	session = { :UserName => nil }

	def authenticate
		authenticate_or_request_with_http_basic do |userName,password,type|
			userName == 'admin' && password == 'admin'
		end
	end

	def if_admin
		if session['admin'] == session[:UserName]
			return true
		else
			redirect_to  :controller => 'users', :action => 'login'
			return false
		end
	end

	def if_logged_in
		if session[:UserName].nil?
			redirect_to login_path
		end
	end
end
