module SessionsHelper

	def logged_in?
  	User.exists?(id: session[:user_id])
	end

	def current_user
  	User.find(session[:user_id])
	end
	
end
