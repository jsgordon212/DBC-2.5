class UsersController < ApplicationController

	include UsersHelper

	def index
		@users = User.all
	end

	def show
		if authorized_user(current_user)
			@user = User.find_by_id params[:id]
			@posts = @user.posts
		else
			redirect_to '/'
		end
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to @user
		else
			render 'new'
		end
	end


	private

		def user_params
  		params.require(:user).permit(:username, :email, :password)
		end

end
