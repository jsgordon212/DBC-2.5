module ApplicationHelper

	def login?
  	User.exists?(session[:user_id])
	end

	def current_user
 	 User.find_by_id params[session[:user_id]] if login?
	end

	def guest_redirect
  	redirect "/login" if !login?
	end

	def authorized_user(user)
  	return true if login? && current_user == user
  	false
	end
end
